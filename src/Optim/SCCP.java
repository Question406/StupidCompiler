package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRVisitor;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.*;
import RISCV.Insts.LA;
import RISCV.Insts.LI;
import RISCV.Insts.LUI;
import RISCV.PhyReg;
import RISCV.StackLoc;
import Utils.BinaryOperator;
import Utils.Exception.SemanticException;
import Utils.UnaryOperator;

import java.util.*;

import static Utils.UnaryOperator.BITWISENEG;
import static Utils.UnaryOperator.LOGICNOT;

// highlight:   Sparse Conditional Constant Propagation
//              modified a bit to support const string propagation
//              SCCP described in Tiger book,
//              SCCP described in Engineering a Compiler has to generate too much edges like <VirReg, Instruction>

public class SCCP extends Optimizer implements IRVisitor {
    private enum LatState {
        undef, constant, multidef
    }

    private static class State {
        ConstInt value;
        ConstString strvalue;
        LatState latState;

        public State(ConstInt value, LatState latState) {
            this.value = value;
            this.latState = latState;
            this.strvalue = null;
        }

        public State(boolean isString, ConstString strvalue, LatState latState) {
            this.strvalue = strvalue;
            this.latState = latState;
            this.value = null;
        }
    }

    public SCCP(Module program) {
        super(program);
    }

    Queue<BasicBlock> BlockWorkList = new LinkedList<BasicBlock>();
    Set<BasicBlock> executableBlocks = new HashSet<BasicBlock>();
    Queue<VirReg> VirRegWorkList = new LinkedList<VirReg>();
    Map<Operand, State> LatStateMap = new HashMap<Operand, State>();

    boolean res = false;

    @Override
    public boolean run() {
        defUseCalC();
        BlockWorkList.clear();
        executableBlocks.clear();
        VirRegWorkList.clear();
        LatStateMap.clear();
        res = false;
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            run(func);
            globalStringRestore(func);
        }
        return res;
    }

    private void globalStringRestore(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
//        for (var bb : RPOBBs) {
//            for (var inst = bb.)
//        }
    }

    private void markExecutable(BasicBlock basicBlock) {
        if (! executableBlocks.contains(basicBlock)) {
            executableBlocks.add(basicBlock);
            BlockWorkList.offer(basicBlock);
        } else {
            // update phi insts
            for (var inst = basicBlock.insthead; inst instanceof PhiInst; inst = inst.next) {
                inst.accept(this);
            }
        }
    }

    private void markMultiDef(Operand operand) {
        if (operand instanceof Variable) return; // global pointers meaningless here
        var oldState = getState(operand);
        assert oldState != null;
        if (oldState.latState != LatState.multidef) {
            oldState.latState = LatState.multidef;
            oldState.value = null;
            VirRegWorkList.offer((VirReg) operand);
        }
    }

    private void markConst(Operand operand, ConstInt constInt) {
        if (operand instanceof Variable) return;
        var oldLatState = getState(operand);
        assert oldLatState != null;
        assert oldLatState.latState != LatState.multidef;
        if (oldLatState.latState == LatState.constant)
            assert constInt.getVal() == oldLatState.value.getVal();
        else {
            oldLatState.latState = LatState.constant;
            oldLatState.value = constInt;
            VirRegWorkList.offer((VirReg) operand);
        }
    }

    private void markConst(Operand operand, ConstString constString) {
        if (operand instanceof Variable) return;
        var oldLatStat = getState(operand);
        assert oldLatStat != null;
        assert oldLatStat.latState != LatState.multidef;
        if (oldLatStat.latState == LatState.constant)
            assert constString.getVal().equals(oldLatStat.strvalue.getVal());
        else {
            oldLatStat.latState = LatState.constant;
            oldLatStat.strvalue = constString;
            VirRegWorkList.offer((VirReg) operand);
        }
    }

    private State getState(Operand operand) {
        var state = LatStateMap.get(operand);
        if (state != null)
            return state;
        if (operand instanceof ConstInt)
            return new State((ConstInt) operand, LatState.constant);
        else if (operand instanceof VirReg) {
            var newState = new State(null, LatState.undef);
            LatStateMap.put(operand, newState);
            return newState;
        } else
            assert false;
        return null;
    }

    private ConstInt getConstOPRes(BinaryOperator op, Operand lhs, Operand rhs) throws RuntimeException {
        assert (lhs instanceof ConstInt && rhs instanceof ConstInt);
        ConstInt res = null;
        int t;
        switch (op) {
            // arithmetic
            case ADD :
                t =((ConstInt) lhs).getVal() + ((ConstInt) rhs).getVal();
                break;
            case SUB:
                t = ((ConstInt) lhs).getVal() - ((ConstInt) rhs).getVal();
                break;
            case MULTI:
                t = ((ConstInt) lhs).getVal() * ((ConstInt) rhs).getVal();
                break;
            case DIV:
                if (((ConstInt) rhs).getVal() == 0)
                    throw new RuntimeException("lueluelue");
                t = ((ConstInt) lhs).getVal() / ((ConstInt) rhs).getVal();
                break;
            case MOD:
                if (((ConstInt) rhs).getVal() == 0)
                    throw new RuntimeException("lueluelue");
                t = ((ConstInt) lhs).getVal() % ((ConstInt) rhs).getVal();
                break;
            case LEFTSHIFT:
                t = ((ConstInt) lhs).getVal() << ((ConstInt) rhs).getVal();
                break;
            case RIGHTSHIFT:
                t = ((ConstInt) lhs).getVal() >> ((ConstInt) rhs).getVal();
                break;

            // int compare
            case LEQ:
                t = (((ConstInt) lhs).getVal() <= ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;
            case REQ:
                t = (((ConstInt) lhs).getVal() >= ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;
            case GTH:
                t = (((ConstInt) lhs).getVal() > ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;
            case LTH:
                t = (((ConstInt) lhs).getVal() < ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;
            case EQ:
                t = (((ConstInt) lhs).getVal() == ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;
            case NEQ:
                t = (((ConstInt) lhs).getVal() != ((ConstInt) rhs).getVal()) ? 1 : 0;
                break;

            // bit operations
            case BITWISEAND:
                t = ((ConstInt) lhs).getVal() & ((ConstInt) rhs).getVal();
                break;
            case BITWISEXOR:
                t = ((ConstInt) lhs).getVal() ^ ((ConstInt) rhs).getVal();
                break;
            case BITWISEOR:
                t = ((ConstInt) lhs).getVal() | ((ConstInt) rhs).getVal();
                break;
            // should never occur
            default:
                throw new SemanticException("should contain no logicAnd && logicOR");
        }
        res = new ConstInt(t);
        return res;
    }

    private ConstInt getConstOPRes(UnaryOperator op, Operand src) {
        assert (op == BITWISENEG || op == LOGICNOT);
        assert (src instanceof ConstInt);
        ConstInt res = null;
        if (op == BITWISENEG)
            res = new ConstInt(~((ConstInt) src).getVal());
        else {
            // must be boolean
            assert (((ConstInt) src).getVal() == 0 || ((ConstInt) src).getVal() == 1);
            res = new ConstInt(1 - ((ConstInt) src).getVal());
        }
        return res;
    }

    private void run(Function func) {
        BlockWorkList.clear();
        executableBlocks.clear();
        VirRegWorkList.clear();
        LatStateMap.clear();

        BlockWorkList.add(func.entryBB);

        // step 1 in Tiger book, set all of args multidef
        if (func.thisPointer != null)
            LatStateMap.put(func.thisPointer, new State(null, LatState.multidef));
        for (var para : func.args)
            LatStateMap.put(para, new State(null, LatState.multidef));

        // Set ConstantStrings to be constant
        for (var constString : program.getStringPool().entrySet())
            LatStateMap.put(constString.getValue(), new State(true, constString.getValue(), LatState.constant));
//            LatStateMap.put(constString.getValue(), new State(true, constString.getValue(), LatState.multidef));

        while (! (BlockWorkList.isEmpty() && VirRegWorkList.isEmpty())) {
            if (!BlockWorkList.isEmpty())
                BlockWorkList.poll().accept(this);

            if (!VirRegWorkList.isEmpty()) {
                var virReg = VirRegWorkList.poll();
                virReg.usedInstructions.forEach(inst -> inst.accept(this));
            }
        }

        // replace VirReg with ConstInt
        for (BasicBlock bb : func.getReversePostOrderBBs()) {
            Instruction nxtInst;
            for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                var def = inst.getDefReg();
                if (def == null || def instanceof Variable) continue;
                assert def instanceof VirReg;
                // replace virreg in original IR
                var state = getState(def);
                assert state != null;
                if (state.latState == LatState.constant) {
                    if (state.value != null) { // Const Int propagation
                        ((VirReg) def).usedInstructions.forEach(useinst -> useinst.modifyUseTOConst((VirReg) def, state.value));
                        inst.RMSelf();
                    }
                    else if (state.strvalue != null) {
                        boolean RMok = true;
                        // don't propagate to phi insts
                        for (var useint : ((VirReg) def).usedInstructions)
                            if (useint instanceof PhiInst) {
                                RMok = false;
                                break;
                            }
                        if (RMok) {
                            var pool = program.getStringPool();
                            // whether stringpool already has the const string
                            if (pool.containsKey(state.strvalue.getVal())) {
                                var strInPool = pool.get(state.strvalue.getVal());
                                ((VirReg) def).usedInstructions.forEach(useinst -> useinst.modifyUseTOConst((VirReg) def, strInPool));
                            } else {
                                pool.put(state.strvalue.getVal(), state.strvalue);
                                ((VirReg) def).usedInstructions.forEach(useinst -> useinst.modifyUseTOConst((VirReg) def, state.strvalue));
                            }
                            inst.RMSelf();
                        }
                    }
                }
            }
        }
    }

    @Override
    public void visit(AllocaInst node) {
        markMultiDef(node.getDefReg());
    }

    @Override
    public void visit(BinOpInst node) {
        var lhsState = getState(node.lhs);
        var rhsState = getState(node.rhs);

        if (lhsState.latState == LatState.constant && rhsState.latState == LatState.constant) {
            ConstInt constRes;
            try {
                constRes = getConstOPRes(node.op, lhsState.value, rhsState.value);
            } catch (Exception e) {
                return;
            }
            markConst(node.res, constRes);
        }
        else if (lhsState.latState == LatState.multidef || rhsState.latState == LatState.multidef)
            markMultiDef(node.res);
    }

    @Override
    public void visit(UnaryOpInst node) {
        var srcState = getState(node.src);
        if (srcState.latState == LatState.constant) {
            ConstInt constRes = getConstOPRes(node.op, srcState.value);
            markConst(node.res, constRes);
        } else
        if (srcState.latState == LatState.multidef)
            markMultiDef(node.res);
    }

    @Override
    public void visit(BranchInst node) {
        var srcState = getState(node.cond);
        if (srcState.latState == LatState.constant) {
            if (srcState.value.getVal() == 1)
                markExecutable(node.trueBB);
            else
                markExecutable(node.elseBB);
        } if (srcState.latState == LatState.multidef) {
            markExecutable(node.trueBB);
            markExecutable(node.elseBB);
        }
    }

    @Override
    public void visit(CmpInst node) {
        var lhsState = getState(node.lhs);
        var rhsState = getState(node.rhs);

        if (lhsState.latState == LatState.constant && rhsState.latState == LatState.constant) {
            ConstInt constRes;
            try {
                constRes = getConstOPRes(node.op, lhsState.value, rhsState.value);
            } catch (Exception e) {
                return;
            }
            markConst(node.res, constRes);
        } else
        if (lhsState.latState == LatState.multidef || rhsState.latState == LatState.multidef)
            markMultiDef(node.res);
    }

    // String functions that can propagate const string
    private boolean isStringFunction(Function calling) {
        if (calling.getFuncname().equals("string.add")) return true;
        if (calling.getFuncname().equals("string.substring")) return true;
        if (calling.getFuncname().equals("string.ord")) return true;
        if (calling.getFuncname().equals("string.parseInt")) return true;
        if (calling.getFuncname().equals("toString")) return true;
        if (calling.getFuncname().equals("string.length")) return true;
        if (calling.getFuncname().equals("string.gth")) return true;
        if (calling.getFuncname().equals("string.lth")) return true;
        if (calling.getFuncname().equals("string.geq")) return true;
        if (calling.getFuncname().equals("string.leq")) return true;
        if (calling.getFuncname().equals("string.eq")) return true;
        return calling.getFuncname().equals("string.neq");
    }

    @Override
    public void visit(FuncCallInst node) {
        if (isStringFunction(node.callTo)) {
            String funcName = node.callTo.getFuncname();
            if (node.res != null) {
                if (funcName.equals("toString")) {
                    assert node.params.size() == 1;
                    var state = getState(node.params.get(0));
                    assert state != null;
                    assert state.strvalue == null;
                    if (state.latState == LatState.constant && state.value != null) {
                        markConst(node.res, new ConstString("\"" + state.value.getVal() + "\""));
                        return;
                    }
                }
                if (funcName.equals("string.length")) {
                    assert node.params.size() == 0 && node.thisPointer != null;
                    var state = getState(node.thisPointer);
                    assert state != null;
                    assert state.value == null;
                    if (state.latState == LatState.constant && state.strvalue != null) {
                        int t = state.strvalue.getVal().length() - 2;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.substring")) {
                    assert node.params.size() == 2 && node.thisPointer != null;
                    var state = getState(node.thisPointer);
                    assert state != null;
                    assert state.value == null;
                    if (state.latState == LatState.constant && state.strvalue != null) {
                        var leftOpr = node.params.get(0);
                        var rightOpr = node.params.get(1);
                        var leftOprState = getState(leftOpr);
                        var rightOprState = getState(rightOpr);
                        assert leftOprState != null;
                        assert rightOprState != null;
                        if (leftOprState.latState == LatState.constant && rightOprState.latState == LatState.constant) {
                            String newString = " ";
                            try {
                                newString = state.strvalue.getVal().substring(leftOprState.value.getVal() + 1, rightOprState.value.getVal() + 1);
                            } catch (Exception e) {
                                markMultiDef(node.res);
                                return;
                            }
                            newString = "\"" + newString + "\"";
                            markConst(node.res, new ConstString(newString));
                            return;
                        }
                    }
                }
                if (funcName.equals("string.ord")) {
                    assert node.params.size() == 1 && node.thisPointer != null;
                    var state = getState(node.thisPointer);
                    assert state != null;
                    assert state.value == null;
                    if (state.latState == LatState.constant && state.strvalue != null) {
                        var argOpr = node.params.get(0);
                        var argOprState = getState(argOpr);
                        assert argOprState != null;
                        if (argOprState.latState == LatState.constant) {
                            int res = state.strvalue.getVal().charAt(argOprState.value.getVal() + 1);
                            markConst(node.res, new ConstInt(res));
                            return;
                        }
                    }
                }
                if (funcName.equals("string.parseInt")) {
                    assert node.params.size() == 1 && node.thisPointer != null;
                    var state = getState(node.thisPointer);
                    assert state != null;
                    assert state.value == null;
                    if (state.latState == LatState.constant && state.strvalue != null) {
//                        var argOpr = node.params.get(0);
                        var argOpr = node.thisPointer;
                        var argOprState = getState(argOpr);
                        assert argOprState != null;
                        if (argOprState.latState == LatState.constant) {
                            String toDO = state.strvalue.getVal().substring(1, state.strvalue.getVal().length() - 1);
                            int res;
                            try {
                                res = Integer.parseInt(toDO);
                            } catch (Exception e) {
                                markMultiDef(node.res);
                                return;
                            }
                            markConst(node.res, new ConstInt(res));
                            return;
                        }
                    }
                }
                if (funcName.equals("string.add")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        String tmp1 = leftstate.strvalue.getVal().substring(0, leftstate.strvalue.getVal().length() - 1);
                        String tmp2 = rightstate.strvalue.getVal().substring(1);
                        String res = tmp1 + tmp2;
                        markConst(node.res, new ConstString(res));
                        return;
                    }
                }
                if (funcName.equals("string.eq")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        boolean res = leftstate.strvalue.getVal().equals(rightstate.strvalue.getVal());
                        int t = (res) ? 1 : 0;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.neq")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        boolean res = leftstate.strvalue.getVal().equals(rightstate.strvalue.getVal());
                        int t = (res) ? 0 : 1;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.gth")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        int res = leftstate.strvalue.getVal().compareTo(rightstate.strvalue.getVal());
                        int t = (res == 1) ? 1 : 0;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.lth")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        int res = leftstate.strvalue.getVal().compareTo(rightstate.strvalue.getVal());
                        int t = (res == -1) ? 1 : 0;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.geq")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        int res = leftstate.strvalue.getVal().compareTo(rightstate.strvalue.getVal());
                        int t = (res == 1 || res == 0) ? 1 : 0;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                if (funcName.equals("string.lth")) {
                    assert node.params.size() == 2 && node.thisPointer == null;
                    var leftstate = getState(node.params.get(0));
                    var rightstate = getState(node.params.get(1));
                    assert leftstate != null && rightstate != null;
                    assert leftstate.value == null && rightstate.value == null;
                    if (leftstate.latState == LatState.constant && leftstate.strvalue != null
                            && rightstate.latState == LatState.constant && rightstate.strvalue != null) {
                        int res = leftstate.strvalue.getVal().compareTo(rightstate.strvalue.getVal());
                        int t = (res == -1 || res == 0) ? 1 : 0;
                        markConst(node.res, new ConstInt(t));
                        return;
                    }
                }
                markMultiDef(node.res);
                return;
            }
        }
        if (node.res != null)
            markMultiDef(node.res);
    }

    @Override
    public void visit(JumpInst node) {
        markExecutable(node.jumpTo);
    }

    @Override
    public void visit(LoadInst node) {
        markMultiDef(node.res);
    }

    @Override
    public void visit(BasicBlock node) {
//        if (node.getName().equals("_afterForBB")){
//            System.out.print("123");
//        }
        for (var inst = node.insthead; inst != null; inst = inst.next)
            inst.accept(this);
    }

    @Override
    public void visit(MoveInst node) {
        var fromState = getState(node.moveFrom);
        assert fromState != null;
        if (fromState.latState == LatState.constant) {
            assert (fromState.value != null || fromState.strvalue != null);
            if (fromState.value != null && fromState.strvalue == null) {
                ConstInt constRes = fromState.value;
                markConst(node.moveTo, constRes);
            }
            else if (fromState.value == null && fromState.strvalue != null) {
                ConstString constRes = fromState.strvalue;
                markConst(node.moveTo, constRes);
            } else
                throw new RuntimeException("unexpected constant value at SCCP");

        } else
        if (fromState.latState == LatState.multidef)
            markMultiDef(node.moveTo);
    }

    @Override
    public void visit(PhiInst node) {
        // have to check all possible path to determine defNode is constint
        boolean candetermine = true;
        ConstInt constInt = null;
        ConstString constString = null;
        int dealingwithInt = -1; // -1 for unkown, 0 for dealing int, 1 for dealing string
        for (var entry : node.from.entrySet()) {
            var fromBB = entry.getKey();
            var fromOpr = entry.getValue();
            if (fromOpr == null) continue; // undef incoming value
            if (! (executableBlocks.contains(fromBB))) {
                candetermine = false;
                dealingwithInt = 0;
                break;
            }
            if (executableBlocks.contains(fromBB)) {
                var State = getState(fromOpr);
                assert State != null;
                if (dealingwithInt == -1) { // determine dealing int or string
                    dealingwithInt = (State.value != null && State.strvalue == null) ? 0 : 1;
                }
                if (State.latState == LatState.constant) {
                    if (dealingwithInt == 0) {
                        if (constInt == null) constInt = State.value;
                        else {
                            if (constInt.getVal() != State.value.getVal()) {
                                candetermine = false;
                                break;
                            }
                        }
                    } else {
                        if (constString == null) constString = State.strvalue;
                        else {
                            if (! constString.getVal().equals(State.strvalue.getVal())) {
                                candetermine = false;
                                break;
                            }
                        }
                    }
                } else if (State.latState == LatState.multidef) {
                    candetermine = false;
                    break;
                }
            }
        }
        if (dealingwithInt == 0) {
            if (candetermine && constInt != null)
                markConst(node.res, constInt);
            else
                markMultiDef(node.res);
        } else if (dealingwithInt == 1){
            if (candetermine && constString != null)
                markConst(node.res, constString);
            else
                markMultiDef(node.res);
        }
    }


    /* ------------------------------------------------------
                    Unused functions
    */
    @Override
    public void visit(LA node) {}

    @Override
    public void visit(LUI node) {

    }

    @Override
    public void visit(PhyReg node) {

    }

    @Override
    public void visit(StackLoc node) {

    }

    @Override
    public void visit(LI node) {

    }

    @Override
    public void visit(RetInst node) {}
    @Override
    public void visit(StoreInst node) {}
    @Override
    public void visit(Operand node) {}
    @Override
    public void visit(Module node) {}
    @Override
    public void visit(Function node) {}
    @Override
    public void visit(ConstString node) {}
    @Override
    public void visit(ConstInt node) {}
    @Override
    public void visit(ConstNull node) {}
    @Override
    public void visit(Variable node) {}
    @Override
    public void visit(VirReg node) {}
}