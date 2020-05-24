package FrontEnd;

import AST.*;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import FrontEnd.Semantic.Scope.ClassScope;
import FrontEnd.Semantic.Scope.GlobalScope;
import FrontEnd.Semantic.Type.*;
import IR.BasicBlock;
import IR.Function;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.*;
import Utils.BinaryOperator;
import Utils.CompileOption;
import Utils.Location;
import Utils.UnaryOperator;

import java.util.ArrayList;
import java.util.Stack;

import static Utils.BinaryOperator.*;

public class IRBuilder implements ASTVisitor {
    Module program;
    boolean isglobal;
    boolean isFuncArg;
    boolean isInClass;
    boolean isGlobalInitInst;
    Variable nowGlobal = null;

    GlobalScope globalScope;
    ClassScope curClassScope;
    TypeTable typeTable;

    Function curFunc;
    BasicBlock curBB;
    Stack<BasicBlock> loopAfterStack;
    Stack<BasicBlock> loopUpdateStack;

    // highlight: for logic exprs : bool d = b != 0 && a / b != 1;      no trueBB elseBB needed
    boolean logicAsInt;

    public Module getIRRoot() {
        return program;
    }

    private Type CastToType(TypeNode typeNode) throws RuntimeException {
        return typeTable.get(typeNode);
    }

    FuncDefNode init;

    private void GlobalVarInitialize(ProgramNode node) {
        globalScope = (GlobalScope) node.getScope();
        ArrayList<ASTNode> toRm = new ArrayList<ASTNode>();
        Location loc = new Location(0, 0);
        ArrayList<VarDefNode> defs = new ArrayList<VarDefNode>();
        ArrayList<StatNode> stats = new ArrayList<StatNode>();
        BlockStatNode blockStatNode = new BlockStatNode(loc, stats);
        init = new FuncDefNode(loc, new VarTypeNode(loc, "int"),"__init", null,  blockStatNode);
        for (var def : node.getProgram_defs()) {
            if (def instanceof VarDefNode) {
                defs.add((VarDefNode) def);
                toRm.add(def);
            }
        }
        stats.add(new VarDefStatNode(loc, new VarDefsNode(loc, defs)));
        node.removeDef(toRm);
        MethodExprNode callmain = new MethodExprNode(loc, new IDExprNode(loc, "main"), null);
        stats.add(new ExprStatNode(loc, callmain));
        callmain.setWhoseEntity((FunctionEntity) globalScope.get("main"));

        globalScope.registerEntity(init);
    }

    private void Initialize(ProgramNode node) {
        logicAsInt = false;
        program = new Module();
        loopAfterStack = new Stack<BasicBlock>();
        loopUpdateStack = new Stack<BasicBlock>();
        typeTable = globalScope.getTypeTable();

        // functions:
        for (var entry : globalScope.getGlobalEntityMap().entrySet()) {
            var name = entry.getKey();
            var entity = entry.getValue();
            if (entity instanceof FunctionEntity) {
                ((FunctionEntity) entity).setName(name);
                Function function = new Function(name);
                function.isVoid = typeTable.get(((FunctionEntity) entity).getType()) instanceof VoidType;
                program.addGlobalFunc(name, function);
            }
        }

        // set class member vars offset
        for (var def : node.getProgram_defs()) {
            if (def instanceof ClassDefNode) {
                curClassScope = (ClassScope) def.getScope();
                // highlight: only bool uses 1-byte alignment, others 4-byte alignment
                ArrayList<VarDefNode> others = new ArrayList<VarDefNode>();
                ArrayList<VarDefNode> bools = new ArrayList<VarDefNode>();
                for (var var : ((ClassDefNode) def).getInclassVar()) {
//                    if (typeTable.get(var.getType()) instanceof BoolType)
//                        bools.add(var);
//                    else
                        others.add(var);
                }
                int offset = 0;
                for (var var : others) {
                    VariableEntity entity = (VariableEntity) curClassScope.get(var.getID());
                    entity.setOffset(offset);
                    offset += CompileOption.INTSIZE;
                }
//                for (var var : bools) {
//                    VariableEntity entity = (VariableEntity) curClassScope.get(var.getID());
//                    entity.setOffset(offset);
//                    offset += CompileOption.BOOLSIZE;
//                }
                ClassType type = (ClassType) typeTable.get(((ClassDefNode) def).getClassType());
                type.setSize(offset);
            }
        }
    }

    @Override
    public void visit(ProgramNode node) throws Exception {
        GlobalVarInitialize(node);
        Initialize(node);
        isglobal = true;
        init.accept(this);
        // global Vars
        for (var def : node.getProgram_defs()) {
            isglobal = true;
            def.accept(this);
            isglobal = false;
        }

    }

    @Override
    public void visit(VarDefNode node) throws Exception {
        Entity entity = node.getScope().get(node.getID());
        if (isglobal) {
            Variable globalVar = new Variable(CastToType(node.getType()), node.getID());
//            curBB.addInst(new AllocaInst(curBB, globalVar, new ConstInt(CompileOption.INTSIZE)));
            entity.setAddr(globalVar);
            program.addGlobalVar(globalVar);
            var init = node.getVarInit();
            if (init != null) {
                isGlobalInitInst = true;
                nowGlobal = globalVar;
                init.accept(this);
                var inst = new MoveInst(curBB, globalVar, init.getOperand());
                curBB.addInst(inst);
                globalVar.initInsts.add(inst);
                nowGlobal = null;
                isGlobalInitInst = false;
//                curBB.addInst(new StoreInst(curBB, globalVar, init.getOperand()));
            }
        } else {
            VirReg virReg = new VirReg(node.getID());
            if (isFuncArg) curFunc.addArg(virReg);
            entity.setAddr(virReg);
            var init = node.getVarInit();
            if (init != null) {
                boolean islogicOp = isLogicOp(init);
                if (islogicOp) {
                    init.setTrueBB(new BasicBlock(curFunc, "logicT"));
                    init.setElseBB(new BasicBlock(curFunc, "logicF"));
                }
                init.accept(this);

                if (!islogicOp) {
                    Operand res;
                    if (init.getOperand() instanceof Pointer) {
                        VirReg t = new VirReg("t");
                        curBB.addInst(new LoadInst(curBB, t, (Pointer) init.getOperand()));
                        res = t;
                    } else
                        res = init.getOperand();
                    curBB.addInst(new MoveInst(curBB, virReg, res));
                } else {
                    var trueBB = init.getTrueBB();
                    var elseBB = init.getElseBB();
                    trueBB.addInst(new MoveInst(trueBB, virReg, new ConstInt(1)));
                    elseBB.addInst(new MoveInst(elseBB, virReg, new ConstInt(0)));
                    BasicBlock afterLogic = new BasicBlock(curFunc, "afterLogic");
                    trueBB.endBB(new JumpInst(trueBB, afterLogic));
                    elseBB.endBB(new JumpInst(elseBB, afterLogic));
                    curBB = afterLogic;
                }
            } else {
//                if (!isFuncArg)
//                    curBB.addInst(new MoveInst(curBB, virReg, new ConstInt(0)));
            }
        }
    }

    @Override
    public void visit(FuncDefNode node) throws Exception {
        String name = "default";
        if (isglobal)
            name = node.getFuncName();
        else if (isInClass)
            name = curClassScope.getClassType().getName() + "." + node.getFuncName();
        assert name.equals("default");
        curFunc = program.getGlobalFunction(name);
        if (isInClass) {
            VirReg this_reg = new VirReg("this");
            curFunc.setThisPointer(this_reg);
        }

        isglobal = name.equals("__init");
        BasicBlock entry = curFunc.getEntryBB();
        isFuncArg = true;
        curBB = entry;
        if (node.getParas() != null) {
            for (var def : node.getParas())
                def.accept(this);
        }
        isFuncArg = false;
        node.getFuncbody().accept(this);

        // no return stat in codes:
        if (!curBB.getEnded()) {
            if (curFunc.isVoid)
                curBB.endBB(new RetInst(curBB, null));
            else
                curBB.endBB(new RetInst(curBB, new ConstInt(0)));
        }
        // collect all return stat into an entryBB
        curFunc.ResolveRetInst();
        curFunc.NaiveRMUnreachableBB();
        curFunc = null;
    }

    @Override
    public void visit(ClassDefNode node) throws Exception {
        isInClass = true;
        isglobal = false;

        curClassScope = (ClassScope) node.getScope();
        for (var method : node.getInclassMethod())
            method.accept(this);
        isInClass = false;
        curClassScope = null;
    }

    @Override
    public void visit(BlockStatNode node) throws Exception {
        for (var stat : node.getStats()) {
            if (stat != null)
                stat.accept(this);
            if (curBB.getEnded())
                break;
        }
    }

    @Override
    public void visit(ConstructorDefNode node) throws Exception {
        String name = "default";
        if (isglobal)
            name = node.getFuncName();
        else if (isInClass)
            name = curClassScope.getClassType().getName() + "." + node.getFuncName();
        assert name.equals("default");

        curFunc = program.getGlobalFunction(name);
        if (isInClass) {
            Pointer this_reg = new Pointer("this", 4);
            curFunc.setThisPointer(this_reg);
        }

        isglobal = false;
        BasicBlock entry = curFunc.getEntryBB();
        isFuncArg = true;
        curBB = entry;
        if (node.getParas() != null) {
            for (var def : node.getParas())
                def.accept(this);
        }
        isFuncArg = false;
        node.getFuncbody().accept(this);
        // no return stat in codes:
        if (!curBB.getEnded()) {
            if (curFunc.isVoid)
                curBB.endBB(new RetInst(curBB, null));
            else
                curBB.endBB(new RetInst(curBB, new ConstInt(0)));
        }
        // collect all return stat into an entryBB
        curFunc.ResolveRetInst();
        curFunc = null;
    }

    @Override
    public void visit(IFStatNode node) throws Exception {
        BasicBlock thenBB = (node.getThen_clause() != null) ? new BasicBlock(curFunc, "if_thenBB") : null;
        BasicBlock elseBB = (node.getElse_clause() != null) ? new BasicBlock(curFunc, "if_elseBB") : null;
        BasicBlock endBB = new BasicBlock(curFunc, "if_end");

        // visit condition Expr
        var cond = node.getCond();
        cond.setTrueBB(thenBB);
        cond.setElseBB((node.getElse_clause() != null) ? elseBB : endBB);
        cond.accept(this);

        // visit thenBB
        if (thenBB != null) {
            curBB = thenBB;
            node.getThen_clause().accept(this);
            if (!curBB.getEnded())
                curBB.endBB(new JumpInst(curBB, endBB));
        }

        // visit elseBB
        if (elseBB != null) {
            curBB = elseBB;
            node.getElse_clause().accept(this);
            if (!curBB.getEnded())
                curBB.endBB(new JumpInst(curBB, endBB));
        }
        curBB = endBB;
    }

    @Override
    public void visit(ForStatNode node) throws Exception {
        var cond = node.getFor_end();
        BasicBlock bodyBB = new BasicBlock(curFunc, "forbodyBB");
        BasicBlock afterForBB = new BasicBlock(curFunc, "afterForBB");
        BasicBlock condBB = (cond != null) ? new BasicBlock(curFunc, "forcondBB") : bodyBB;
        BasicBlock updateBB = (node.getFor_update() != null) ? new BasicBlock(curFunc, "forupdateBB") : condBB;

        loopUpdateStack.push(updateBB);
        loopAfterStack.push(afterForBB);

        if (node.getFor_init() != null) {
            if (node.getFor_init() instanceof AssignExprNode || node.getFor_init() instanceof VarDefStatNode)
                node.getFor_init().accept(this);
        }

        curBB.endBB(new JumpInst(curBB, condBB));
        // change to for cond
        if (cond != null) {
            cond.setTrueBB(bodyBB);
            cond.setElseBB(afterForBB);
            curBB = condBB;
            cond.accept(this);
        }

        // change to loopbody
        curBB = bodyBB;
        if (node.getWhile_body() != null)
            node.getWhile_body().accept(this);

        // change to forupdate
        if (!curBB.getEnded())
            curBB.endBB(new JumpInst(curBB, updateBB));

        if (node.getFor_update() != null) {
            curBB = updateBB;
            node.getFor_update().accept(this);
            if (!curBB.getEnded())
                curBB.endBB(new JumpInst(curBB, condBB));
        }

        loopUpdateStack.pop();
        loopAfterStack.pop();
        curBB = afterForBB;
    }

    @Override
    public void visit(BreakStatNode node) throws Exception {
        curBB.endBB(new JumpInst(curBB, loopAfterStack.peek()));
    }

    @Override
    public void visit(ContinueStatNode node) throws Exception {
        curBB.endBB(new JumpInst(curBB, loopUpdateStack.peek()));
    }

    private boolean isLogicOp(ExprNode node) {
        if (node instanceof BinaryExprNode) {
            var op = ((BinaryExprNode) node).getOp();
            return op == LOGICAND || op == LOGICOR;
        } else if (node instanceof PrefixExprNode)
            return ((PrefixExprNode) node).getOp() == UnaryOperator.LOGICNOT;
        return false;
    }

    @Override
    public void visit(ReturnStatNode node) throws Exception {
        if (node.getReturn_expr() == null)
            curBB.endBB(new RetInst(curBB, null));
        else {
            var retExpr = node.getReturn_expr();
            if (isLogicOp(retExpr)) {
                logicAsInt = true;
                retExpr.accept(this);
                curBB.endBB(new RetInst(curBB, getVal(retExpr.getOperand())));
                logicAsInt = false;
            }else {
                retExpr.accept(this);
                curBB.endBB(new RetInst(curBB, getVal(retExpr.getOperand())));
            }
        }
    }

    @Override
    public void visit(VarDefStatNode node) throws Exception {
        node.getVarDefs().accept(this);
    }

    @Override
    public void visit(ExprStatNode node) throws Exception {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(INTEGERNode node) throws Exception {
        node.setOperand(new ConstInt(node.getValue()));
    }

    @Override
    public void visit(STRINGNode node) throws Exception {
        var operand = program.getConstString(node.getValue());
        if (operand != null)
            node.setOperand(operand);
        else {
            operand = new ConstString(node.getValue());
            node.setOperand(operand);
            program.addConstString(operand);
        }
    }

    @Override
    public void visit(NULLNode node) throws Exception {
        node.setOperand(new ConstInt(0));
    }

    @Override
    public void visit(BOOLNode node) throws Exception {
        boolean bool = node.getBool_val().equals("true");
        node.setOperand(new ConstInt(bool ? 1 : 0));
        if (node.getTrueBB() != null)
            curBB.endBB(new BranchInst(curBB, node.getOperand(), node.getTrueBB(), node.getElseBB()));
    }

    @Override
    public void visit(IDExprNode node) throws Exception {
        // highlight: id only gives the addr, not the value
        VariableEntity entity = node.getEntity();
        if (entity == null) return;
        if (entity.isClassMember()) {
            //Pointer resAddr = new Pointer("classVar addr");
            Pointer resAddr = new Pointer("t", 4);
            node.setOperand(resAddr);
            curBB.addInst(new BinOpInst(curBB, resAddr, BinaryOperator.ADD, new ConstInt(entity.getOffset()), curFunc.getThisPointer()));
            if (node.getTrueBB() != null) {
                VirReg tmp = new VirReg("t");
                curBB.addInst(new LoadInst(curBB, tmp, resAddr));
                curBB.endBB(new BranchInst(curBB, tmp, node.getTrueBB(), node.getElseBB()));
            }
        } else {
            node.setOperand(entity.getAddr());
            if (node.getTrueBB() != null)
                curBB.endBB(new BranchInst(curBB, entity.getAddr(), node.getTrueBB(), node.getElseBB()));
        }
    }

    @Override
    public void visit(BinaryExprNode node) throws Exception {
        BinaryOperator op = node.getOp();
        switch (op) {
            // logicOP
            case LOGICAND:
            case LOGICOR:
//                if (!logicAsInt)
                if (node.getTrueBB() != null)
                    handleLogicBinaryExpr(node);
                else
                    handleLogicBinaryExprAsInt(node);
                break;
            // RelationOP
            case EQ:
            case NEQ:
            case LEQ:
            case REQ:
            case LTH:
            case GTH:
                boolean oldlogicAsInt = logicAsInt;
                logicAsInt = true;
                handleRelationBinExpr(node);
                logicAsInt = oldlogicAsInt;
                break;
            // ArithematicOP
            case ADD:
            case SUB:
            case MULTI:
            case DIV:
            case MOD:
            case LEFTSHIFT:
            case RIGHTSHIFT:
            case BITWISEAND:
            case BITWISEOR:
            case BITWISEXOR:
                boolean oldlogicAsInt1 = logicAsInt;
                logicAsInt = oldlogicAsInt1;
                handleArithematicBinExpr(node);
                logicAsInt = oldlogicAsInt1;
                break;
        }
    }

    private void handleLogicBinaryExpr(BinaryExprNode node) throws Exception {
        var lhs = node.getLHS();
        var rhs = node.getRHS();
        if (node.getOp() == BinaryOperator.LOGICAND) {
            // for left hand
            // lhs true doesn't mean expr true
            lhs.setTrueBB(new BasicBlock(curFunc, "ifTrue"));
            lhs.setElseBB(node.getElseBB());
            lhs.accept(this);
            curBB = lhs.getTrueBB();

            // for right hand
            rhs.setTrueBB(node.getTrueBB());
            rhs.setElseBB(node.getElseBB());
            rhs.accept(this);
        } else {
            // for left hand
            lhs.setTrueBB(node.getTrueBB());
            // lhs false doesn't mean expr true
            lhs.setElseBB(new BasicBlock(curFunc, "iffalse"));
            lhs.accept(this);
            curBB = lhs.getElseBB();

            // for right hand
            rhs.setTrueBB(node.getTrueBB());
            rhs.setElseBB(node.getElseBB());
            rhs.accept(this);
        }
    }

    private void handleLogicBinaryExprAsInt(BinaryExprNode node) throws Exception {
        var lhs = node.getLHS();
        var rhs = node.getRHS();
        rhs.accept(this);
        lhs.accept(this);
        var op = (node.getOp() == BinaryOperator.LOGICAND) ? LOGICAND : LOGICOR;
        VirReg res = new VirReg("t");
        node.setOperand(res);
        curBB.addInst(new BinOpInst(curBB, res, node.getOp(), lhs.getOperand(), rhs.getOperand()));
    }


    private void handleRelationBinExpr(BinaryExprNode node) throws Exception {
        var lhs = node.getLHS();
        var rhs = node.getRHS();
        rhs.accept(this);
        lhs.accept(this);
        if (lhs.getType() instanceof IntegerType || lhs.getType() instanceof BoolType) {
            VirReg reg = new VirReg("t");
            node.setOperand(reg);
            curBB.addInst(new CmpInst(curBB, reg, node.getOp(), getVal(lhs.getOperand()), getVal(rhs.getOperand())));

            // work as a cond in some place like: if (a > b), control flow needs changing
            if (node.getTrueBB() != null)
                curBB.endBB(new BranchInst(curBB, reg, node.getTrueBB(), node.getElseBB()));
        } else if (lhs.getType() instanceof StringType) {
            Function callingFunc;
            var op = node.getOp();
            VirReg res = new VirReg("t");
            node.setOperand(res);
            ArrayList<Operand> params = new ArrayList<Operand>();
            switch (op) {
                case LTH:
                case LEQ:
                case REQ:
                case GTH:
                    if (op == LTH) callingFunc = Module.builtinStringLTH;
                    else if (op == LEQ) callingFunc = Module.builtinStringLEQ;
                    else if (op == REQ) callingFunc = Module.builtinStringGEQ;
                    else callingFunc = Module.builtinStringGTH;
                    // string > string
                    params.add(getVal(lhs.getOperand()));
                    params.add(getVal(rhs.getOperand()));
                    curBB.addInst(new FuncCallInst(curBB, callingFunc, params, res));
                    break;
                case EQ:
                case NEQ:
                    if (op == EQ) callingFunc = Module.builtinStringEQ;
                    else callingFunc = Module.builtinStringNEQ;
                    if (lhs.getType() instanceof StringType && rhs.getType() instanceof StringType) {
                        // string == string
                        params.add(getVal(lhs.getOperand()));
                        params.add(getVal(rhs.getOperand()));
                        curBB.addInst(new FuncCallInst(curBB, callingFunc, params, res));
                    } else if (lhs.getType() instanceof NullType || rhs.getType() instanceof NullType) {
                        // string == null || null == string
                        curBB.addInst(new BinOpInst(curBB, res, op, getVal(lhs.getOperand()), getVal(rhs.getOperand())));
                    }
                    break;
                default:
                    System.out.println("unknown err at handleRelationBinExpr");
                    assert (true);
            }
            if (node.getTrueBB() != null)
                curBB.endBB(new BranchInst(curBB, res, node.getTrueBB(), node.getElseBB()));
        } else {
            // pointer == null || null == pointer
            var op = node.getOp();
            assert !(op == EQ || op == NEQ);
            VirReg res = new VirReg("t");
            curBB.addInst(new CmpInst(curBB, res, op, getVal(lhs.getOperand()), getVal(rhs.getOperand())));
            if (node.getTrueBB() != null)
                curBB.endBB(new BranchInst(curBB, res, node.getTrueBB(), node.getElseBB()));
        }
    }

    private void handleArithematicBinExpr(BinaryExprNode node) throws Exception {
        var lhs = node.getLHS();
        var rhs = node.getRHS();
        rhs.accept(this);
        lhs.accept(this);
        if (lhs.getType() instanceof IntegerType) {
            VirReg reg = new VirReg("t");
            node.setOperand(reg);
            curBB.addInst(new BinOpInst(curBB, reg, node.getOp(), getVal(lhs.getOperand()), getVal(rhs.getOperand())));
        } else if (lhs.getType() instanceof StringType) {
            assert (node.getOp() == BinaryOperator.ADD);
            // call stringAdd
            VirReg res = new VirReg("t");
            node.setOperand(res);
            ArrayList<Operand> params = new ArrayList<Operand>();
            params.add(getVal(lhs.getOperand()));
            params.add(getVal(rhs.getOperand()));
            FuncCallInst call = new FuncCallInst(curBB, Module.builtinStringAdd, params, res);
            curBB.addInst(call);
        } else
            throw new RuntimeException("unkown error at handleArithematicBin");
    }

    @Override
    public void visit(PrefixExprNode node) throws Exception {
        var op = node.getOp();
        var subExpr = node.getSubExpr();

        if (op == UnaryOperator.LOGICNOT && node.getTrueBB() != null) {
            subExpr.setTrueBB(node.getElseBB());
            subExpr.setElseBB(node.getTrueBB());
            subExpr.accept(this);
            return;
        }

        subExpr.accept(this);
        Operand resReg = getVal(subExpr.getOperand());
        Operand res = new VirReg("t");

        switch (op) {
            case PREFIX_ADD:
                curBB.addInst(new BinOpInst(curBB, resReg, BinaryOperator.ADD, resReg, new ConstInt(1)));
                node.setOperand(resReg);
                break;
            case PREFIX_SUB:
                curBB.addInst(new BinOpInst(curBB, resReg, BinaryOperator.SUB, resReg, new ConstInt(1)));
                node.setOperand(resReg);
                break;
            case POSITIVE:
                node.setOperand(resReg);
                break;
            case NEGATIVE:
                node.setOperand(res);
                curBB.addInst(new BinOpInst(curBB, res, BinaryOperator.SUB, new ConstInt(0), resReg));
                break;
            case BITWISENEG:
                node.setOperand(res);
                curBB.addInst(new UnaryOpInst(curBB, res, op, resReg));
                break;
            case LOGICNOT:
                node.setOperand(res);
                curBB.addInst(new UnaryOpInst(curBB, res, op, resReg));
        }
        if (subExpr.getOperand() instanceof Pointer)
            curBB.addInst(new StoreInst(curBB, subExpr.getOperand(), resReg));
    }

    private boolean isMemAccess(ExprNode node) {
        return (node instanceof MemberExprNode || node instanceof IndexExprNode);
    }

    @Override
    public void visit(PostFixExprNode node) throws Exception {
        // post++, post--
        BinaryOperator op = (node.getOp() == UnaryOperator.POST_ADD) ? BinaryOperator.ADD : BinaryOperator.SUB;
        var subExpr = node.getExpr();
        subExpr.accept(this);
        Operand subRes = subExpr.getOperand();

        // old value
        Operand oldReg = getVal(subRes);
        if (subRes instanceof Pointer) {
            VirReg res = new VirReg("t");
            curBB.addInst(new BinOpInst(curBB, res, op, oldReg, new ConstInt(1)));
            curBB.addInst(new StoreInst(curBB, subRes, res));
            node.setOperand(oldReg);
        } else {
            VirReg tmp = new VirReg("t");
            curBB.addInst(new MoveInst(curBB, tmp, oldReg));
            curBB.addInst(new BinOpInst(curBB, subRes, op, oldReg, new ConstInt(1)));
            node.setOperand(tmp);
        }
    }

    @Override
    public void visit(VarTypeNode node) throws Exception {
    }

    @Override
    public void visit(ArrayTypeNode node) throws Exception {
    }

    // FIXME:   new int[]
    //          new int[10]
    //          new int[10][]
    //          A a = new A
    //          int[] a = new int[]
    //          int[][] a = new int[5][]
    @Override
    public void visit(NEWExprNode node) throws Exception {
        var typeNode = node.getTypeNode();
        Type type;
        if (typeNode instanceof ArrayTypeNode) {
            type = typeTable.get(((ArrayTypeNode) typeNode).getBaseType());
//            for (var dim : node.getDimExpr())
//                dim.accept(this);
            node.setOperand(NewArrayAllocate(node,1, node.getDimExpr().size()));
        } else {
            type = typeTable.get(typeNode);
            VirReg res = new VirReg("t");
            var inst = new AllocaInst(curBB, res, new ConstInt(type.allocSize()));
//            var inst = new AllocaInst(curBB, res, new ConstInt(CompileOption.INTSIZE));
            curBB.addInst(inst);
            if (isGlobalInitInst) {
                nowGlobal.initInsts.add(inst);
            }

            if (type instanceof ClassType) {
                Function func = program.getGlobalFunction(type.getName() + "." + type.getName());
                if (func != null) {
                    ArrayList<Operand> params = new ArrayList<>();
                    var newInst = new FuncCallInst(curBB, func, params, null);
                    newInst.thisPointer = res;
                    curBB.addInst(newInst);
                }
            }

            node.setOperand(res);
        }
    }

    // highlight:   recursively int[][][] a = new int[6][5][]
    //              1:  6 ptr ptr ptr ptr ptr ptr
    //              2:    ptr1: 5 ptr ptr ptr ptr ptr
    //              3:    ptr2: 5 ptr ptr ptr ptr ptr
    private Operand NewArrayAllocate(NEWExprNode node, int nowdim, int realdim) throws Exception {
        ExprNode dimExpr = node.getDimExpr().get(nowdim - 1);
        dimExpr.accept(this);
        VirReg resAddrReg = new VirReg("t");

        if (nowdim == realdim) {
            // A[][] a = new A[5][6]
//            Operand elemSize = (nowdim == node.getDim()) ? new ConstInt(typeTable.get(((ArrayTypeNode) node.getTypeNode()).getBaseType()).allocSize()) : new ConstInt(CompileOption.INTSIZE);
            Operand elemSize = new ConstInt(CompileOption.INTSIZE);
            VirReg dimSizeReg = new VirReg("t");
            // calculate size for a dim
            curBB.addInst(new BinOpInst(curBB, dimSizeReg, BinaryOperator.MULTI, dimExpr.getOperand(), elemSize));
            curBB.addInst(new BinOpInst(curBB, dimSizeReg, BinaryOperator.ADD, dimSizeReg, new ConstInt(CompileOption.INTSIZE)));
            // allocate memory space
            curBB.addInst(new AllocaInst(curBB, resAddrReg, dimSizeReg));
            // store size
            curBB.addInst(new StoreInst(curBB, resAddrReg, dimExpr.getOperand()));
            // return addr reg
            return resAddrReg;
        } else {
            // pointer size
            Operand elemSize = new ConstInt(CompileOption.INTSIZE);
            VirReg dimSizeReg = new VirReg("t");
            // calculate size for a dim
            curBB.addInst(new BinOpInst(curBB, dimSizeReg, BinaryOperator.MULTI, dimExpr.getOperand(), elemSize));
            curBB.addInst(new BinOpInst(curBB, dimSizeReg, BinaryOperator.ADD, dimSizeReg, new ConstInt(CompileOption.INTSIZE)));
            // allocate memory space
            curBB.addInst(new AllocaInst(curBB, resAddrReg, dimSizeReg));
            // store size
            curBB.addInst(new StoreInst(curBB, resAddrReg, dimExpr.getOperand()));

            // highlight:   have to add an IR-for in case : int[][] a = new int[b][4]
            //              init is just the start pointer
            //              update && body merges into a single inst of add
            BasicBlock condBB = new BasicBlock(curFunc, "forcondBB");
            BasicBlock updateBB = new BasicBlock(curFunc, "forupdateBB");
            BasicBlock afterForBB = new BasicBlock(curFunc, "afterForBB");

            VirReg for_IReg = new VirReg("t");
            VirReg end_reg = new VirReg("t");
            VirReg condres = new VirReg("t");
            VirReg tmp = new VirReg("t");
            //  highlight: worked as for (pointer start; start <= end; start += pointersize) { &res = allocate new array; }
            // initialize
            curBB.addInst(new MoveInst(curBB, for_IReg, resAddrReg));
            curBB.addInst(new BinOpInst(curBB, for_IReg, BinaryOperator.ADD, for_IReg, new ConstInt(CompileOption.INTSIZE)));
            curBB.addInst(new MoveInst(curBB, tmp, new ConstInt(CompileOption.INTSIZE)));
            curBB.addInst(new BinOpInst(curBB, tmp, BinaryOperator.MULTI, tmp, dimExpr.getOperand()));
            curBB.addInst(new MoveInst(curBB, end_reg, resAddrReg));
            curBB.addInst(new BinOpInst(curBB, end_reg, BinaryOperator.ADD, end_reg, tmp));
            curBB.endBB(new JumpInst(curBB, condBB));

            curBB = condBB;
            condBB.addInst(new CmpInst(condBB, condres, LEQ, for_IReg, end_reg));
            curBB.endBB(new BranchInst(curBB, condres, updateBB, afterForBB));

            curBB = updateBB;
            // store pointer
            var res = NewArrayAllocate(node, nowdim + 1, realdim);
            curBB.addInst(new StoreInst(curBB, for_IReg, res));
            //curBB.addInst(new StoreInst(curBB, for_IReg, NewArrayAllocate(node, nowdim + 1, realdim)));
            curBB.addInst(new BinOpInst(curBB, for_IReg, BinaryOperator.ADD, for_IReg, new ConstInt(CompileOption.INTSIZE)));
            curBB.endBB(new JumpInst(curBB, condBB));

            curBB = afterForBB;
            return resAddrReg;
        }
    }

    @Override
    public void visit(MemberExprNode node) throws Exception {
        node.getWhose().accept(this);
        // a.x
        Entity entity = node.getWhoseEntity();
        if (entity instanceof VariableEntity) {
            // variable touch
            Pointer resPointer = new Pointer("t", 4);
            curBB.addInst(new BinOpInst(curBB, resPointer, BinaryOperator.ADD, getVal(node.getWhose().getOperand()), new ConstInt(((VariableEntity) entity).getOffset())));
            node.setOperand(resPointer);

            // example: if (a.x == 1)
            if (node.getTrueBB() != null) {
                VirReg res = new VirReg("t");
                curBB.addInst(new LoadInst(curBB, res, resPointer));
                curBB.endBB(new BranchInst(curBB, res, node.getTrueBB(), node.getElseBB()));
            }
        } else {
            // function call
            // just return variable addr
            node.setOperand(node.getWhose().getOperand());
        }
    }

    @Override
    public void visit(MethodExprNode node) throws Exception {
        var whose = node.getWhose();

        whose.accept(this);
        FunctionEntity entity = node.getWhoseEntity();
        Function func = program.getGlobalFunction(entity.getName());
        ArrayList<Operand> realParas = new ArrayList<Operand>();
        VirReg res = (entity.isVoid()) ? null : new VirReg("t");
        FuncCallInst call = new FuncCallInst(curBB, func, realParas, res);
        node.setOperand(res);

        if (!entity.name().equals("main") && entity.getInClass()) {
            if (whose instanceof IDExprNode)
                call.thisPointer = curFunc.thisPointer;
            else
                call.thisPointer = getVal(whose.getOperand());
        }

        var Paras = node.getParas();
        if (Paras != null) {
            for (var para : Paras) {
                para.accept(this);
                call.addParam(getVal(para.getOperand()));
            }
        }
        curBB.addInst(call);
        if (node.getTrueBB() != null) {
            curBB.endBB(new BranchInst(curBB, res, node.getTrueBB(), node.getElseBB()));
        }
        if (entity.name().equals("main"))
            curBB.endBB(new RetInst(curBB, res));
    }


    @Override
    public void visit(FormalParasNode formalParasNode) throws Exception {

    }

    // highlight:   two cases for indexExpr
    //              lvalue : b[5] = 10,
    //              rvalue : a = b[6]
    @Override
    public void visit(IndexExprNode node) throws Exception {
        var array = node.getArray();
        var index = node.getIndex();
        array.accept(this);
        index.accept(this);
//        ConstInt singleSize = new ConstInt(node.getType().allocSize());
        ConstInt singleSize = new ConstInt(CompileOption.INTSIZE);
        Operand startAddr = getVal(array.getOperand());
        Pointer resPointer = new Pointer("t", 4);
        VirReg tmpreg = new VirReg("t");
        VirReg tmpreg2 = new VirReg("t");
        // get addr offset for a[6] to a;
        curBB.addInst(new BinOpInst(curBB, tmpreg, BinaryOperator.MULTI, getVal(index.getOperand()), singleSize));
        curBB.addInst(new BinOpInst(curBB, tmpreg2, BinaryOperator.ADD, tmpreg, new ConstInt(CompileOption.INTSIZE)));
        curBB.addInst(new BinOpInst(curBB, resPointer, BinaryOperator.ADD, startAddr, tmpreg2));
        node.setOperand(resPointer);
        if (node.getTrueBB() != null) {
            curBB.endBB(new BranchInst(curBB, getVal(node.getOperand()), node.getTrueBB(), node.getElseBB()));
        }
    }

    @Override
    public void visit(AssignExprNode node) throws Exception {
        var lhs = node.getLhs();
        var rhs = node.getRhs();

        boolean islogicOp = isLogicOp(rhs);

        if (islogicOp) {
            rhs.setTrueBB(new BasicBlock(curFunc, "logicT"));
            rhs.setElseBB(new BasicBlock(curFunc, "logicF"));
        }
        rhs.accept(this);
        lhs.accept(this);
        if (!islogicOp) {
            Operand rhsVal = rhs.getOperand();
            Operand res = null;
            if (rhsVal instanceof Pointer) {
                VirReg tmp = new VirReg("t");
                res = tmp;
                curBB.addInst(new LoadInst(curBB, tmp, (Pointer) rhsVal));
            } else
                res = rhsVal;
            if (lhs.getOperand() instanceof Pointer)
                curBB.addInst(new StoreInst(curBB, lhs.getOperand(), res));
            else
                curBB.addInst(new MoveInst(curBB, lhs.getOperand(), res));
            node.setOperand(res);
        } else {
            var trueBB = rhs.getTrueBB();
            var elseBB = rhs.getElseBB();
            var virReg = lhs.getOperand();
            if (virReg instanceof Pointer) {
                trueBB.addInst(new StoreInst(trueBB, virReg, new ConstInt(1)));
                elseBB.addInst(new StoreInst(elseBB, virReg, new ConstInt(0)));
            } else {
                trueBB.addInst(new MoveInst(trueBB, virReg, new ConstInt(1)));
                elseBB.addInst(new MoveInst(elseBB, virReg, new ConstInt(0)));
            }
            BasicBlock afterLogic = new BasicBlock(curFunc, "afterLogic");
            trueBB.endBB(new JumpInst(trueBB, afterLogic));
            elseBB.endBB(new JumpInst(elseBB, afterLogic));
            curBB = afterLogic;
        }
    }

    private void assign(ExprNode lhs, ExprNode rhs) {
        if (lhs.getOperand() instanceof Pointer && rhs.getOperand() instanceof Pointer){

        }
    }

    @Override
    public void visit(ThisExprNode node) throws Exception {
        assert (! isInClass);
        node.setOperand(curFunc.getThisPointer());
    }

    @Override
    public void visit(WhileStatNode node) throws Exception {
        BasicBlock bodyBB = new BasicBlock(curFunc, "whileBodyBB");
        BasicBlock condBB = new BasicBlock(curFunc, "whileCondBB");
        BasicBlock afterWhileBB = new BasicBlock(curFunc, "afterWhileBB");

        loopUpdateStack.push(condBB);
        loopAfterStack.push(afterWhileBB);

        // condBB
        curBB.endBB(new JumpInst(curBB, condBB));
        curBB = condBB;
        var cond = node.getCond();
        if (cond != null) {
            cond.setTrueBB(bodyBB);
            cond.setElseBB(afterWhileBB);
            cond.accept(this);
        }

//        curBB.endBB(new JumpInst(curBB, bodyBB));

        curBB = bodyBB;
        if (node.getWhile_body() != null)
            node.getWhile_body().accept(this);
        if (! curBB.getEnded())
            curBB.endBB(new JumpInst(curBB, condBB));

        loopAfterStack.pop();
        loopUpdateStack.pop();
        curBB = afterWhileBB;
    }

    @Override
    public void visit(VoidTypeNode voidTypeNode) throws Exception {}

    @Override
    public void visit(ClassTypeNode classTypeNode) {}

    @Override
    public void visit(VarDefsNode varDefsNode) throws Exception {
        for (var def : varDefsNode.getVarDefs())
            def.accept(this);
    }

    // tool functions:
    private Operand getVal(Operand asking) {
        if (asking instanceof Pointer) {
            VirReg resVal = new VirReg("t");
            curBB.addInst(new LoadInst(curBB, resVal, (Pointer) asking));
            return resVal;
        } else
            return asking;
    }
}