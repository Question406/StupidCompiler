package FrontEnd.Semantic;

import AST.*;
import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import FrontEnd.Semantic.Scope.*;
import FrontEnd.Semantic.Type.*;
import IR.Function;
import Utils.BinaryOperator;
import Utils.ErrorHandler;
import Utils.Exception.SemanticException;
import Utils.Location;
import Utils.UnaryOperator;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;

public class SemanticAnalyzer implements ASTVisitor {
    GlobalScope globalScope;
    LinkedList<Scope> scopeStack;
    TypeTable typeTable;
    ErrorHandler errorHandler;
    FunctionEntity currentFunc;

    FuncDefNode initFunc;

    // for this expr in inClass method
    Type currentClassType;
    boolean inClass;
    // for break, continue stat
    int inLoop;

    public SemanticAnalyzer(ErrorHandler h) {
        this.errorHandler = h;
        this.scopeStack = new LinkedList<Scope>();
        this.typeTable = new TypeTable();
        globalScope = new GlobalScope();
        globalScope.setTypeTable(typeTable);
        inClass = false;
        inLoop = 0;
    }

    private void GlobalEntityInitialize(ProgramNode node) {
        // Initialize:
        scopeStack.add(globalScope);
        globalScope.registerBuiltInFuncs();
        // highlight: Treat string as a class
        Location loc = new Location(0, 0);
        FunctionEntity entity;
        String strname = "string";
        ArrayList<VariableEntity> param = null;
        entity = new FunctionEntity(new VarTypeNode(loc, "int"), strname + ".length", param, globalScope, null);
        entity.setInClass(true);
        globalScope.put(strname + ".length", entity);

        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "left", null));
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "right", null));
        entity = new FunctionEntity(new VarTypeNode(loc, "string"), strname + ".substring", param, globalScope, null);
        entity.setInClass(true);
        globalScope.put(strname + ".substring", entity);

        param = null;
        entity = new FunctionEntity(new VarTypeNode(loc, "int"), strname + ".parseInt", param, globalScope, null);
        entity.setInClass(true);
        globalScope.put(strname + ".parseInt", entity);

        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "pos", null));
        entity = new FunctionEntity(new VarTypeNode(loc, "int"), strname + ".ord", param, globalScope, null);
        entity.setInClass(true);
        globalScope.put(strname + ".ord", entity);

        entity = new FunctionEntity(new VarTypeNode(loc, "int"), "array.size", null, globalScope, null);
        entity.setInClass(true);
        globalScope.put("array.size", entity);

        for (var def : node.getProgram_defs()){
            if (def instanceof ClassDefNode) {
                typeTable.put((ClassDefNode) def);

                String className = ((ClassDefNode) def).getClassname();
                int offset = 0;
                for (var inClassVar : ((ClassDefNode) def).getInclassVar()) {
                    VariableEntity ventity = new VariableEntity(inClassVar);
                    ventity.setClassMember(true);
                    if (inClassVar.getID().equals(className))
                        throw new SemanticException("invalid member var name");
                    globalScope.put(className + "." + inClassVar.getID(), ventity);
                }
                for (var inClassMethod : ((ClassDefNode) def).getInclassMethod()) {
                    FunctionEntity ventity = null;
                    if (inClassMethod instanceof ConstructorDefNode) {
                        if (!inClassMethod.getFuncName().equals(className))
                            throw new SemanticException("invalid constructor func in : " + className);
                        ventity = new FunctionEntity(inClassMethod, true);
                    } else {
                        if (inClassMethod.getFuncName().equals(className))
                            throw new SemanticException("invalid inclass func def");
                        ventity = new FunctionEntity(inClassMethod, false);
                    }
                    ventity.setInClass(true);
                    globalScope.put(className + "." + inClassMethod.getFuncName(), ventity);
                }
            } else if (def instanceof FuncDefNode) {
                globalScope.registerEntity(def);
            }
        }
    }

    @Override
    public void visit(ProgramNode node) throws Exception {
        //System.out.println("Semantic Analyze begin:");

        // highlight:   the order matters, to support forward reference, define globalVar, funcs first
        //              then recursive classDef calls, then resolve fun
        GlobalEntityInitialize(node);

        // LocalResolve && Recursive visit call
        var program_defs = node.getProgram_defs();
        for (var def : program_defs) {
            if (def instanceof ClassDefNode) {
                def.accept(this);
            } else if (def instanceof FuncDefNode) {
                currentFunc = (FunctionEntity) currentScope().get(((FuncDefNode) def).getFuncName());
                def.accept(this);
            } else {
                // VarDefNode
                // highlight: global variables don't support forward reference
                currentScope().registerEntity(def);
                def.accept(this);
            }
        }

        // Check main Func registered
        // FIXME: main override not tested
        FunctionEntity mainFunc = null;
        try {
            mainFunc = (FunctionEntity) currentScope().get("main");
        } catch (Exception e) {
            throw new SemanticException("main func not defined");
        }
        if (mainFunc.getParamList() != null) {
            throw new SemanticException("main func should have no params");
        }
        if (! (typeTable.get(mainFunc.getType()) instanceof IntegerType))
            throw new SemanticException("main func should return an int");
        node.setScope((GlobalScope) currentScope());

    }

    @Override
    public void visit(VarDefNode node) throws Exception {
        // a var shouldn't be void a;
        if (node.getType() instanceof VoidTypeNode)
            throw new SemanticException("variable should not be void" + node.getID() + " " + node.getLocation());

        node.setScope(currentScope());
        // Type resolve:
        node.getType().accept(this);

        // Local resovle:
        var initExpr = node.getVarInit();
        // initExprs resovle:
        if (initExpr != null) {
            // Expr resovle:
            initExpr.accept(this);
            // vardef resolve:
            Type lh_type = typeTable.get(node.getType());
            Type rh_type = initExpr.getType();
            if (cannotAssign(lh_type, rh_type))
                throw new SemanticException("var def not clear at: " + node.getID() + " " + node.getLocation());
        }
    }

    @Override
    public void visit(FuncDefNode node) throws Exception {
        // found problem at basic-35.mx
        if (typeTable.hasName(node.getFuncName()))
            throw new SemanticException("duplicated name for: " + node.getFuncName());

        LocalScope scope = new LocalScope(currentScope());
        scopeStack.add(scope);
        // type resovle:
        node.getFunctype().accept(this);

        // For local resolve:
        var paras = node.getParas();
        ArrayList<VariableEntity> parasEntity;
        if (paras != null) {
            // add params to local:
            //parasEntity = new ArrayList<VariableEntity>();
            for (VarDefNode para : paras) {
                // recursive call:
                scope.registerVariable(para);
                para.accept(this);
            }
        }

        for (var stat : node.getFuncbody().getStats()) {
            // for blank stat
            if (stat == null) continue;
            stat.accept(this);
        }
        node.setScope((LocalScope) popScope());
    }

    @Override
    public void visit(ClassDefNode node) throws Exception {
        ClassScope scope = new ClassScope((GlobalScope) currentScope());
        scope.setClassType((ClassType) typeTable.get(((ClassDefNode) node).getClassType()));
        scopeStack.add(scope);
        currentClassType = scope.getClassType();
        inClass = true;

        String className = node.getClassname();
        // local Resolve :
        // inclass vars:
        var inClassVars = node.getInclassVar();
        for (VarDefNode inClassVar : inClassVars) {
            if (inClassVar.getID().equals(node.getClassname()))
                throw new SemanticException("invalid member variable in Class " +node.getClassname());
            String name = inClassVar.getID();
            scope.registerEntity(name, globalScope.get(className + "." + name));
            inClassVar.accept(this);
        }

        // inclass methods:
        var inClassMethods = node.getInclassMethod();
        // register funcs
        for (var inClassMethod : inClassMethods) {
            String name = inClassMethod.getFuncName();
            scope.registerEntity(name, globalScope.get(className + "." + name));
        }

        // resolve after register
        for (var inClassMethod : inClassMethods) {
            currentFunc = (FunctionEntity) scope.get(inClassMethod.getFuncName());
            inClassMethod.accept(this);
        }

        node.setScope((ClassScope) popScope());
        currentClassType = null;
        inClass = false;
    }

    @Override
    public void visit(BlockStatNode node) throws Exception {
        ArrayList<StatNode> stats = node.getStats();
        // highlight: fuck {;}, fuck misc-12.mx for this fucking idiot {{{;};{}}};
        if (stats == null)
            return;

        LocalScope scope = new LocalScope(currentScope());
        scopeStack.add(scope);
        node.setScope(scope);
        for (var stat : stats) {
            if (stat != null)
                stat.accept(this);
        }

        popScope();
    }

    @Override
    public void visit(ConstructorDefNode node) throws Exception {
        LocalScope scope = new LocalScope(currentScope());
        scopeStack.add(scope);

        // For local resolve:
        var paras = node.getParas();
        ArrayList<VariableEntity> parasEntity;
        if (paras != null) {
            parasEntity = new ArrayList<VariableEntity>();
            for (VarDefNode para : paras) {
                // recursive call:
                para.accept(this);

                parasEntity.add(new VariableEntity(para));
            }

            // add params to local:
            pushScope(parasEntity);
        }
        for (var stat : node.getFuncbody().getStats()) {
            stat.accept(this);
        }

        node.setScope((LocalScope) popScope());
    }

    @Override
    public void visit(IFStatNode node) throws Exception {
        node.getCond().accept(this);
        // FIXME: ???????
        if (! (node.getCond().getType() instanceof BoolType))
            throw new SemanticException("cond in if stat not a boolean expr");
        // recursive_call at then_clause
        if (node.getThen_clause() != null) {
            // highlight: even not a block, has to create a new field
            if (node.getThen_clause() instanceof BlockStatNode)
                node.getThen_clause().accept(this);
            else {
                LocalScope scope = new LocalScope((LocalScope) currentScope());
                scopeStack.add(scope);

                node.getThen_clause().accept(this);
                node.getThen_clause().setScope((LocalScope) popScope());
            }
        }
        // recursive_call at else_clause
        if (node.getElse_clause() != null) {
            // highlight: even not a block, has to create a new field
            if (node.getElse_clause() instanceof BlockStatNode)
                node.getElse_clause().accept(this);
            else {
                LocalScope scope = new LocalScope((LocalScope) currentScope());
                scopeStack.add(scope);

                node.getElse_clause().accept(this);
                node.getElse_clause().setScope((LocalScope) popScope());
            }
        }
    }

    // highlight: to resolve for (int a = 0... ).. , for stat always create a new field
    @Override
    public void visit(ForStatNode node) throws Exception {
        LoopScope scope = new LoopScope(currentScope());
        scopeStack.add(scope);

        // into loopScope
        inLoop++;

        if (node.getFor_init() != null) {
            if (node.getFor_init() instanceof VarDefsNode) {
                var varDef = ((VarDefsNode) node.getFor_init()).getVarDefs();
                varDef.get(0).setScope(scope);
                varDef.get(0).accept(this);
                if (varDef.size() != 1)
                    throw new SemanticException("unexpected for_init");
                scope.registerVariable(varDef.get(0));
            } else if (node.getFor_init() instanceof ExprNode) {
                node.getFor_init().accept(this);
            } else
                throw new SemanticException("unknown expr for for_init" + node.getLocation());
        }
        if (node.getFor_end() != null) {
            node.getFor_end().accept(this);
            if (!(node.getFor_end().getType() instanceof BoolType))
                throw new SemanticException("for_end should be a bool expr: " + node.getLocation());
        }
        if (node.getFor_update() != null)
            node.getFor_update().accept(this);

        if (node.getWhile_body() != null) {
            if (node.getWhile_body() instanceof BlockStatNode) {
                for (var stat : ((BlockStatNode) node.getWhile_body()).getStats())
                    stat.accept(this);
            } else
                node.getWhile_body().accept(this);
        }

        node.setScope((LocalScope) popScope());

        inLoop--;
    }

    @Override
    public void visit(BreakStatNode node) throws Exception {
        if (inLoop < 1)
            throw new SemanticException("break not in a loop" + node.getLocation());
    }

    @Override
    public void visit(ContinueStatNode node) throws Exception {
        if (inLoop < 1)
            throw new SemanticException("continue not in a loop" + node.getLocation());
    }

    @Override
    public void visit(ReturnStatNode node) throws Exception {
//        if (!(currentScope() instanceof LocalScope) || currentFunc.isConstructor()) {
        if (!(currentScope() instanceof LocalScope)) {
            throw new SemanticException("return not in func: " + node.getLocation());
        }
        if (currentFunc.isVoid()) {
            if (node.getReturn_expr() != null)
                throw new SemanticException("void func should return nothing: " + node.getLocation());
        } else {
            if (node.getReturn_expr() == null)
                throw new SemanticException("func should return something: " + node.getLocation());
            ExprNode expr = node.getReturn_expr();
            expr.accept(this);
//            if (! expr.getType().isSameType(typeTable.get(currentFunc.getType()))){
//                throw new SemanticException("return type error " + currentFunc.name());
//            }
            Type returnType = expr.getType();
            Type expectType = typeTable.get(currentFunc.getType());
            if (cannotAssign(expectType, returnType))
                throw new SemanticException("return type error " + currentFunc.name());
        }
    }

    @Override
    public void visit(VarDefStatNode node) throws Exception {
        var varDefs = node.getVarDefs().getVarDefs();
        for (var varDef : varDefs) {
            varDef.accept(this);
            currentScope().registerEntity(varDef);
        }
    }

    @Override
    public void visit(ExprStatNode node) throws Exception {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(INTEGERNode node) {
        node.setType(new IntegerType());
        node.setLvalue(false);
    }

    @Override
    public void visit(STRINGNode node) {
        node.setType(new StringType(0));
        node.setLvalue(false);
    }

    @Override
    public void visit(NULLNode node) {
        node.setType(new NullType());
        node.setLvalue(false);
    }

    @Override
    public void visit(BOOLNode node) {
        node.setType(new BoolType());
        node.setLvalue(false);
    }

    @Override
    public void visit(IDExprNode node) throws Exception {
        // local resolve:
        Entity entity = currentScope().get(node.getName());
        if (entity == null)
            throw new SemanticException("undefined variable");
        else if (entity instanceof FunctionEntity)
            throw new SemanticException(node.getName() + " not a variable");
        else if (typeTable.hasName(node.getName()))
            throw new SemanticException("invalid var call for name is a class Name");

        entity.refered();
        node.setType(typeTable.get(entity.getType()));
        node.setLvalue(true);
        node.setEntity((VariableEntity) entity);
    }

    // for string: could be +, <, >, <=, >=, !=, ==
    // for int: *, /, %, +, -, <<, >>, <, >, <=, >=, ==, !=, &, ^, |
    // for bool: only &&, ||
    // TODO: type cast not supported
    @Override
    public void visit(BinaryExprNode node) throws Exception {
        // recursive call
        node.setLvalue(false);
        ExprNode lhs = node.getLHS();
        ExprNode rhs = node.getRHS();
        BinaryOperator op = node.getOp();
        lhs.accept(this);
        rhs.accept(this);
        Type lType = lhs.getType();
        Type rType = rhs.getType();

        // bool op bool
        if (op == BinaryOperator.LOGICAND ||
            op == BinaryOperator.LOGICOR)
        {
            if (!((lType instanceof BoolType && rType instanceof BoolType)))
                throw new SemanticException("expr invalid for (bool op bool)" + node.getLocation());
            else
                node.setType(new BoolType());
        }
        // int op int
        if (op == BinaryOperator.MULTI ||
            op == BinaryOperator.DIV ||
            op == BinaryOperator.MOD ||
            op == BinaryOperator.SUB ||
            op == BinaryOperator.LEFTSHIFT ||
            op == BinaryOperator.RIGHTSHIFT ||
            op == BinaryOperator.BITWISEAND ||
            op == BinaryOperator.BITWISEOR ||
            op == BinaryOperator.BITWISEXOR)
        {
            if (!(lType instanceof IntegerType && rType instanceof IntegerType))
                throw new SemanticException("expr invalid at (int op int): " + node.getLocation());
            else
                node.setType(new IntegerType());
        }

        // int + int or string + string
        if (op == BinaryOperator.ADD) {
            if (lType instanceof IntegerType && rType instanceof IntegerType) {
                node.setType(new IntegerType());
            } else if (lType instanceof StringType && rType instanceof StringType){
                node.setType(new StringType(0));
            } else
                throw new SemanticException("expr invalid at (lhs + rsh): " + node.getLocation());
        }

        // int|string <, >, <=, >= int|string
        if (op == BinaryOperator.LEQ ||
            op == BinaryOperator.REQ ||
            op == BinaryOperator.GTH ||
            op == BinaryOperator.LTH) {
            if ((lType instanceof IntegerType && rType instanceof IntegerType) ||
                (lType instanceof StringType && rType instanceof StringType))
                node.setType(new BoolType());
            else
                throw new SemanticException("expr invalid at (lhs < rhs): " + node.getLocation());
        }

        // lhs ==, != rhs
        if (op == BinaryOperator.EQ ||
            op == BinaryOperator.NEQ) {
            if ((lType instanceof IntegerType && rType instanceof IntegerType) ||
                (lType instanceof StringType && rType instanceof StringType) ||
                (lType instanceof BoolType && rType instanceof BoolType) ||
                (lType instanceof ClassType && rType instanceof ClassType) ||
                (lType instanceof ClassType && rType instanceof NullType) ||
                (lType instanceof NullType && rType instanceof NullType) ||
                (lType instanceof ArrayType && rType instanceof ArrayType) ||
                (lType instanceof ArrayType && rType instanceof NullType) ||
                (lType instanceof NullType && rType instanceof ArrayType))
            {
                node.setType(new BoolType());
            }
            else
                throw new SemanticException("expr invalid at (lhs ==, != rhs): " + node.getLocation());
        }
    }

    @Override
    public void visit(PrefixExprNode node) throws Exception {
        node.setLvalue(false);

        ExprNode expr = node.getSubExpr();
        expr.accept(this);
        UnaryOperator op = node.getOp();
        if (op == UnaryOperator.POSITIVE ||
            op == UnaryOperator.NEGATIVE)
        {
            if (!(expr.getType() instanceof IntegerType))
                throw new SemanticException("unary expr invalid at : " + node.getLocation());
            else
                node.setType(new IntegerType());
        }
        if (op == UnaryOperator.PREFIX_ADD ||
            op == UnaryOperator.PREFIX_SUB )
        {
            if (!(expr.getType() instanceof IntegerType) || !expr.isLvalue())
                throw new SemanticException("unary expr invalid at : " + node.getLocation());
            else
                node.setType(new IntegerType());
            node.setLvalue(true);
        }
        if (op == UnaryOperator.BITWISENEG){
            if (!(expr.getType() instanceof IntegerType))
                throw new SemanticException("unary expr invalid at : " + node.getLocation());
            else
                node.setType(new IntegerType());
        }
        if (op == UnaryOperator.LOGICNOT) {
            if (!(expr.getType() instanceof BoolType || expr.getType() instanceof IntegerType))
                throw new SemanticException("unary expr invalid at : " + node.getLocation());
            else
                node.setType(new BoolType());
        }
    }

    @Override
    public void visit(PostFixExprNode node) throws Exception {
        node.setLvalue(false);
        ExprNode expr = node.getExpr();
        expr.accept(this);
        // a++++ not valid;
        if (!(expr.getType() instanceof IntegerType)  || ! expr.isLvalue())
            throw new SemanticException("unary expr invalid at : " + node.getLocation());
        else
            node.setType(new IntegerType());
    }

    @Override
    public void visit(VarTypeNode node) throws Exception {
        if (! typeTable.isDefined(node))
            throw new SemanticException("type " + node.name() + " not defined");
    }

    @Override
    public void visit(ArrayTypeNode node) throws Exception {
        if (! typeTable.isDefined(node.getBaseType()))
            throw new SemanticException("type " + node.name() + " not defined");
    }

    @Override
    public void visit(NEWExprNode node) throws Exception {
        node.setLvalue(false);
        node.getTypeNode().accept(this);

        TypeNode typeNode = node.getTypeNode();
        var dimExprs = node.getDimExpr();
        if (typeNode instanceof ArrayTypeNode) {
            TypeNode baseTypeNode = ((ArrayTypeNode) typeNode).getBaseType();
            Type baseType = typeTable.get(baseTypeNode);
            for (var dimExpr : dimExprs) {
                if (dimExpr == null) break;
                dimExpr.accept(this);
                if (! (dimExpr.getType() instanceof IntegerType))
                    throw new SemanticException("invalid new expr at " + node.getLocation());
            }
            node.setType(new ArrayType(baseType, ((ArrayTypeNode) typeNode).getDim()));
        } else {
            Type type = typeTable.get(node.getTypeNode());
            if (dimExprs == null) {
                node.setType(type);
            }
            else {
                 throw new SemanticException("invalid new expr at " + node.getLocation());
            }
        }
    }

    @Override
    public void visit(MemberExprNode node) throws Exception {
        node.setLvalue(false);
        ExprNode whose = node.getWhose();
        node.getWhose().accept(this);
        Type type = whose.getType();
        String name = node.getmemberID();
        if (type instanceof ArrayType) {
            if (!((ArrayType) type).hasMethod(name))
                throw new SemanticException("Array doens't have func " + name + " " + node.getLocation());
            else {
                node.setType(((ArrayType) type).getMethodType(name));
                node.setwhoseEntity(globalScope.get("array.size"));
            }
        } else if (type instanceof StringType) {
            if (! (((StringType) type).hasMethod(name)))
                throw new SemanticException("string doens't have func " + name + " " + node.getLocation());
            else {
                FunctionTypeNode funcTypeNode = (FunctionTypeNode) ((ClassType) type).getMethodTypeNode(name);
                Type returnType = typeTable.get(funcTypeNode.getReturnType());
                ArrayList<Type> params = null;
                ArrayList<TypeNode> paramList = funcTypeNode.getParamList();
                if (paramList != null) {
                    params = new ArrayList<Type>();
                    for (var para : paramList)
                        params.add(typeTable.get(para));
                }
                node.setType(new FunctionType(name, returnType, params));
                node.setwhoseEntity(globalScope.get("string" + "." + name));
            }
        } else if (type instanceof ClassType){
            if (! (((ClassType) type).hasVar(name) || ((ClassType) type).hasMethod(name)))
                throw new SemanticException("Class doens't have " + name + " " + node.getLocation());
            if (((ClassType) type).hasVar(name)) {
                node.setLvalue(true);

                TypeNode typeNode = ((ClassType) type).getVarType(name);
                node.setType(typeTable.get(typeNode));
                Entity entity = globalScope.get(type.getName() + "." + name);
                entity.refered();
                node.setwhoseEntity(entity);
            }
            else {
                FunctionTypeNode funcTypeNode = (FunctionTypeNode) ((ClassType) type).getMethodTypeNode(name);
                Type returnType = typeTable.get(funcTypeNode.getReturnType());
                ArrayList<Type> params = null;
                ArrayList<TypeNode> paramList = funcTypeNode.getParamList();
                if (paramList != null) {
                    params = new ArrayList<Type>();
                    for (var para : paramList)
                        params.add(typeTable.get(para));
                }
                node.setType(new FunctionType(name, returnType, params));
                Entity entity = globalScope.get(type.getName() + "." + name);
                node.setwhoseEntity(entity);
                entity.refered();
            }
        }
    }

    // TODO: function override not supported now
    @Override
    public void visit(MethodExprNode node) throws Exception {
        node.setLvalue(false);
        ExprNode whose = node.getWhose();
        // find the function entity "whose" refers to
        if (whose instanceof IDExprNode) {
            // eg: add(a, b);
            Entity entity = currentScope().get(((IDExprNode) whose).getName());
            entity.refered();

            if (entity == null)
                throw new SemanticException("undefined function");
            else if (entity instanceof VariableEntity)
                throw new SemanticException(((IDExprNode) whose).getName() + " ambiguous name");
            node.setWhoseEntity((FunctionEntity) entity);
        } else if (whose instanceof MemberExprNode) {
            // eg: a.add(x, y), for
            whose.accept(this);
            Type type = whose.getType();
            if (!(type instanceof FunctionType))
                throw new SemanticException("invalid method call, whose is not a function " + node.getLocation());
            else {
                FunctionEntity entity = (FunctionEntity) ((MemberExprNode) whose).getWhoseEntity();
                //node.setWhoseEntity((FunctionEntity) ((MemberExprNode) (whose)).getWhoseEntity());
                entity.refered();
                node.setWhoseEntity(entity);
            }
        }

        // check para
        FunctionEntity entity = node.getWhoseEntity();

        // set type for "set(x, y)" . ...
        node.setType(typeTable.get(entity.getType()));

        var expectParams = entity.getParamList();
        var realParams = node.getParas();
        if ((expectParams != null && realParams == null) || (expectParams == null && realParams != null))
            throw new SemanticException("func " + entity.getName() + " expects more/less params " + node.getLocation());
        // para don't need check
        if (expectParams == null && realParams == null)
            return;
        // para check
        if (expectParams.size() != realParams.size())
            throw new SemanticException("func " + entity.getName() + " expects more/less params " + node.getLocation());

        int size = expectParams.size();
        for (int i = 0; i < size; i++) {
            ExprNode para = realParams.get(i);
            Type expectType = typeTable.get(expectParams.get(i).getType());
            if (para != null)
                para.accept(this);

            var t = para.getType();
            //if (! para.getType().isSameType(expectType))
            if (cannotAssign(expectType, para.getType()))
                throw new SemanticException("func " + entity.getName() + " expects different type para" + node.getLocation());
        }
    }

    // not used
    @Override
    public void visit(FormalParasNode formalParasNode) {

    }

    // for a[1][2], its array: a[1]   index: [2]
    @Override
    public void visit(IndexExprNode node) throws Exception {
        node.setLvalue(true);

        ExprNode array = node.getArray();
        ExprNode index = node.getIndex();
        array.accept(this);
        index.accept(this);

        Type indexType = index.getType();
        if (!(indexType instanceof IntegerType))
            throw new SemanticException("invalid index expr " + index.getLocation());

        Type arrayType = array.getType();

        if (!(arrayType instanceof ArrayType))
            throw new SemanticException("invalid array expr, not an array " + array.getLocation());

        int dim = ((ArrayType) arrayType).getDim() - 1;
        if (dim == 0)
            node.setType(((ArrayType) arrayType).getBaseType());
        else
            node.setType(new ArrayType(((ArrayType) arrayType).getBaseType(), dim));
    }

    @Override
    public void visit(AssignExprNode node) throws Exception {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();

        lhs.accept(this);
        rhs.accept(this);
        if (!lhs.isLvalue() || cannotAssign(lhs.getType(), rhs.getType()))
            throw new SemanticException(lhs.getType().toString() + " can't be assigned to " + rhs.getType().toString() + " " + node.getLocation());
    }

    @Override
    public void visit(ThisExprNode node) throws Exception {
        if (! inClass)
            throw new SemanticException("this not in a class: " + node.getLocation());
        else
            node.setType(currentClassType);
    }

    @Override
    public void visit(WhileStatNode node) throws Exception {
        LoopScope scope = new LoopScope(currentScope());
        scopeStack.add(scope);

        inLoop++;

        if (node.getCond() != null) {
            node.getCond().accept(this);
            // highlight:   in break-continue3.mx, there exists
            //              while (1) {
            if (! (node.getCond().getType() instanceof BoolType || node.getCond().getType() instanceof IntegerType) )
                throw new SemanticException("while_stat should have a bool expr cond: " + node.getLocation());
        }

        if (node.getWhile_body() != null) {
            if (node.getWhile_body() instanceof BlockStatNode) {
                for (var stat : ((BlockStatNode) node.getWhile_body()).getStats())
                    stat.accept(this);
            } else
                node.getWhile_body().accept(this);
        }

        node.setScope((LocalScope) popScope());

        inLoop--;
    }

    @Override
    public void visit(VoidTypeNode node) throws Exception {
        if (! typeTable.isDefined(node))
            throw new SemanticException("void not defined");
    }

    @Override
    public void visit(ClassTypeNode classTypeNode) {

    }

    @Override
    public void visit(VarDefsNode node) throws Exception {
        for (var varDef : node.getVarDefs())
            varDef.accept(this);
    }

    // ----------------------------------------------------------------
    // tool funcitons
    private Scope popScope() {
        return scopeStack.removeLast();
    }

    private Scope currentScope() {
        return scopeStack.getLast();
    }

    private void pushScope(ArrayList<VariableEntity> vars) throws SemanticException {
        LocalScope scope = new LocalScope(currentScope());
        for (var tmp_var : vars)
            if (scope.isDefinedLocally(tmp_var.name())) {
                throw new SemanticException("duplicated variable in scope: " + tmp_var.name());
            } else {
                scope.registerVariable(tmp_var);
            }
        scopeStack.addLast(scope);
    }

    private boolean cannotAssign(Type lh_type, Type rh_type) {
        if (rh_type instanceof NullType)
            return !(lh_type instanceof ArrayType || lh_type instanceof ClassType);
        else {
            if (lh_type instanceof NullType || lh_type instanceof VoidType)
                return true;
            else {
                // special case
                if (lh_type instanceof IntegerType && rh_type instanceof BoolType)
                    return false;

                return !lh_type.isSameType(rh_type);
            }
        }
    }

}