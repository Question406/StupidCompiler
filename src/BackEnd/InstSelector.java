package BackEnd;

import IR.Function;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.*;
import RISCV.Insts.LA;
import RISCV.Insts.LI;
import RISCV.Insts.LUI;
import RISCV.RISCV_Info;
import RISCV.StackLoc;
import Utils.BinaryOperator;

import java.util.ArrayList;
import java.util.Map;

import static Utils.BinaryOperator.*;
import static Utils.CompileOption.INTSIZE;

// add LI insts to IR
// change binary expr into ADDIs && ADDRs
// resolve address computation && other things

public class InstSelector {
    Module program;

    int MAXIMM = (1 << 11) - 1;
    int MINIMM = -(1 << 11);

    public InstSelector(Module program) {
        this.program = program;
    }

    public void run() {
        int cnt = 0;
        for (Map.Entry<String, ConstString> entry : program.getStringPool().entrySet()) {
            String key = entry.getKey();
            ConstString str = entry.getValue();
            str.name = "_globalStr" + (cnt++);
        }
        program.getGlobalFuncMap().forEach((name, func) -> {
            if (!Function.isBuiltIn(func))
                run(func);  // inst transform
        });
    }

    private Operand getOpr(Operand asking, boolean canbeImm, Instruction Inst) {
        if (asking instanceof ConstInt) {
            if (((ConstInt) asking).getVal() == 0)
                return RISCV_Info.virtualPhyRegs.get("zero");
            var val = ((ConstInt) asking).getVal();
            if (val > MAXIMM || val < MINIMM) {
                VirReg tmp = new VirReg("t");
                Inst.linkPrev(new LI(Inst.curBB, tmp, (ConstInt) asking));
                return tmp;
            } else {
                if (canbeImm) return asking;
                else {
                    VirReg tmp = new VirReg("t");
                    Inst.linkPrev(new LI(Inst.curBB, tmp, (ConstInt) asking));
                    return tmp;
                }
            }
        } else if (asking instanceof VirReg)
            return asking;
        return null;
    }

    private RISCV.BinaryOperator getOp(BinaryOperator op, boolean isImm) {
        switch (op) {
            case MULTI:
                assert !isImm;
                return RISCV.BinaryOperator.mul;
            case DIV:
                assert !isImm;
                return RISCV.BinaryOperator.div;
            case MOD:
                assert !isImm;
                return RISCV.BinaryOperator.mod;
            case ADD:
                return (isImm) ? RISCV.BinaryOperator.addi : RISCV.BinaryOperator.add;
            case SUB:
                assert !isImm;
                return RISCV.BinaryOperator.sub;
            case LEFTSHIFT:
                return (isImm) ? RISCV.BinaryOperator.slli : RISCV.BinaryOperator.sll;
            case RIGHTSHIFT:
                return (isImm) ? RISCV.BinaryOperator.srai : RISCV.BinaryOperator.sra;
            case LTH:
                return (isImm) ? RISCV.BinaryOperator.slti : RISCV.BinaryOperator.slt;
            case BITWISEXOR:
                return (isImm) ? RISCV.BinaryOperator.xori : RISCV.BinaryOperator.xor;
            case BITWISEAND:
            case LOGICAND:
                return (isImm) ? RISCV.BinaryOperator.andi : RISCV.BinaryOperator.and;
            case BITWISEOR:
            case LOGICOR:
                return (isImm) ? RISCV.BinaryOperator.ori : RISCV.BinaryOperator.or;
            default:
                System.err.println(op);
                throw new RuntimeException("unexpected op at translate OP");
        }
    }

    private void run(Function func) {
        // argument passing
        ArrayList<Operand> paras = new ArrayList<>();
        if (func.getThisPointer() != null)
            paras.add(func.getThisPointer());
        paras.addAll(func.getArgs());

        // > 8 arguments
        for (int i = 8; i < paras.size(); i++) {
            func.entryBB.insthead.linkPrev(new LoadInst(func.entryBB, paras.get(i), new StackLoc(func, true, i - 8), INTSIZE));
        }
        for (int i = 0; i < Integer.min(8, paras.size()); i++)
            func.entryBB.insthead.linkPrev(new MoveInst(func.entryBB, paras.get(i), RISCV_Info.virtualPhyRegs.get("a" + i)));

        // mv callee saved regs
        for (var reg : RISCV_Info.calleeSavedRegs) {
            VirReg newReg = new VirReg("back_" + reg);
            func.entryBB.insthead.linkPrev(new MoveInst(func.entryBB, newReg, RISCV_Info.virtualPhyRegs.get(reg)));
            func.exitBB.insttail.linkPrev(new MoveInst(func.exitBB, RISCV_Info.virtualPhyRegs.get(reg), newReg));
        }
        VirReg ra = new VirReg("backup_ra");
        func.entryBB.insthead.linkPrev(new MoveInst(func.entryBB, ra, RISCV_Info.virtualPhyRegs.get("ra")));
        func.exitBB.insttail.linkPrev(new MoveInst(func.exitBB, RISCV_Info.virtualPhyRegs.get("ra"), ra));

        // return val passing
        RetInst retInst = (RetInst) func.exitBB.insttail;
        if (retInst.retVal != null) {
            retInst.linkPrev(new MoveInst(func.exitBB, RISCV_Info.virtualPhyRegs.get("a0"), retInst.retVal));
//            retInst.retVal = RISCV_Info.virtualPhyRegs.get("a0");
            retInst.retVal = null;
        }

        //  inst transformation including
        //  1:  Imm translation
        //  2:  Func Call translation
        //  3:  alloc translation
        var RPOBBs = func.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            Instruction nxtInst;
            for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                if (inst instanceof BinOpInst) {
                    var binInst = ((BinOpInst) inst);
                    var lhs = binInst.lhs;
                    var rhs = binInst.rhs;
                    var op = binInst.op;
                    if (op.isCommutative()) {
                        if (lhs instanceof ConstInt && (! (rhs instanceof ConstInt))) {
                            binInst.lhs = rhs;
                            binInst.rhs = lhs;
                            lhs = binInst.lhs;
                            rhs = binInst.rhs;
                        }
                    }
                    var lhsOpr = getOpr(lhs, false, binInst);
                    var rhsOpr = getOpr(rhs, op == ADD || op == LEFTSHIFT
                            || op == RIGHTSHIFT || op == BITWISEXOR
                            || op == BITWISEAND || op == BITWISEOR, binInst);
                    binInst.lhs = lhsOpr;
                    binInst.rhs = rhsOpr;
                    binInst.isImmInst = rhsOpr instanceof ConstInt;
                    binInst.riscvop = getOp(op, ((BinOpInst) inst).isImmInst);
                } else if (inst instanceof CmpInst) {
                    var cmpInst = (CmpInst) inst;
                    if (cmpInst.res.usedInstructions.size() == 1 && cmpInst.res.usedInstructions.iterator().next() instanceof BranchInst)
                        continue; // could be built into Branch

                    var lhs = cmpInst.lhs;
                    var rhs = cmpInst.rhs;
                    Operand lhsOpr;
                    Operand rhsOpr;
                    var op = cmpInst.op;
                    VirReg res;
                    switch (op) {
                        case LTH :  // <
                            lhsOpr = getOpr(lhs, false, cmpInst);
                            rhsOpr = getOpr(rhs, true, cmpInst);
                            cmpInst.isImmInst = rhsOpr instanceof ConstInt;
                            cmpInst.riscvop = getOp(op, cmpInst.isImmInst);
                            cmpInst.lhs = lhsOpr;
                            cmpInst.rhs = rhsOpr;
                            break;
                        case GTH:   // >, reverse lhs, rhs
                            lhsOpr = getOpr(rhs, false, cmpInst);
                            rhsOpr = getOpr(lhs, true, cmpInst);
                            cmpInst.isImmInst = rhsOpr instanceof ConstInt;
                            cmpInst.riscvop = getOp(BinaryOperator.LTH, cmpInst.isImmInst);
                            cmpInst.lhs = lhsOpr;
                            cmpInst.rhs = rhsOpr;
                            break;
                        case LEQ:   // <=: >, res xor 1
                            lhsOpr = getOpr(rhs, false, cmpInst);
                            rhsOpr = getOpr(lhs, true, cmpInst);
                            cmpInst.isImmInst = rhsOpr instanceof ConstInt;
                            cmpInst.riscvop = getOp(BinaryOperator.LTH, cmpInst.isImmInst);
                            cmpInst.lhs = lhsOpr;
                            cmpInst.rhs = rhsOpr;
                            res = new VirReg("t");
                            BinOpInst newBinOPinst = new BinOpInst(cmpInst.curBB, res, getOp(BITWISEXOR, true), cmpInst.res, new ConstInt(1));
                            newBinOPinst.isImmInst = true;
                            cmpInst.linkNext(newBinOPinst);
                            break;
                        case REQ:   // >=
                            lhsOpr = getOpr(lhs, false, cmpInst);
                            rhsOpr = getOpr(rhs, true, cmpInst);
                            cmpInst.isImmInst = rhsOpr instanceof ConstInt;
                            cmpInst.riscvop = getOp(BinaryOperator.LTH, cmpInst.isImmInst);
                            cmpInst.lhs = lhsOpr;
                            cmpInst.rhs = rhsOpr;
                            res = new VirReg("t");
//                            var tmp1 = new VirReg("t");
//                            cmpInst.linkPrev(new LI(inst.curBB, tmp1, new ConstInt(1 << 32 - 1)));
                            BinOpInst newBin = new BinOpInst(cmpInst.curBB, cmpInst.res, getOp(BITWISEXOR, true), res, new ConstInt(1));
                            newBin.isImmInst = true;
                            cmpInst.linkNext(newBin);
                            cmpInst.res = res;
                            break;
                        case EQ:    // ==
                            if (lhs instanceof ConstInt && (! (rhs instanceof ConstInt))) {
                                var tmp = lhs;
                                lhs = rhs;
                                rhs = tmp;
                            }
                            res = (VirReg) cmpInst.res;
                            lhsOpr = getOpr(lhs, false, cmpInst);
                            rhsOpr = getOpr(rhs, true, cmpInst);
                            cmpInst.isImmInst = rhsOpr instanceof ConstInt;
                            BinOpInst newInst = new BinOpInst(cmpInst.curBB, res, getOp(BITWISEXOR, cmpInst.isImmInst), lhsOpr, rhsOpr);
                            newInst.isImmInst = rhsOpr instanceof ConstInt;
                            cmpInst.linkPrev(newInst);
                            cmpInst.RMSelf();
                            break;
                        case NEQ:   // !=
                            if (lhs instanceof ConstInt && (!(rhs instanceof ConstInt))) {
                                var tmp = lhs;
                                lhs = rhs;
                                rhs = tmp;
                            }
                            var newVir = new VirReg("t");
                            lhsOpr = getOpr(lhs, false, cmpInst);
                            rhsOpr = getOpr(rhs, true, cmpInst);
                            BinOpInst newInst2 = new BinOpInst(cmpInst.curBB, newVir, getOp(BITWISEXOR, cmpInst.isImmInst), lhsOpr, rhsOpr);
                            cmpInst.linkPrev(newInst2);
                            cmpInst.riscvop = RISCV.BinaryOperator.sltu;
                            cmpInst.isImmInst = false;
                            cmpInst.rhs = newVir;
                            break;
                        default:
                            throw new RuntimeException("unexpected op at cmpInst");
                    }
                } else if (inst instanceof UnaryOpInst) {
//                    ConstInt newTmp = new ConstInt( 1 << 32 - 1);
//                    VirReg newVirReg = new VirReg("t");
//                    BinOpInst newInst;
//                    var unaInst = ((UnaryOpInst) inst);
//                    unaInst.linkPrev(new LI(inst.curBB, newVirReg, newTmp));
//                    var src = unaInst.src;
//                    var res = unaInst.res;
//                    newInst = new BinOpInst(inst.curBB, res, RISCV.BinaryOperator.xor, src, newVirReg);
//                    newInst.isImmInst = false;
                    var unaInst = ((UnaryOpInst) inst);
                    var src = unaInst.src;
                    var res = unaInst.res;
                    BinOpInst newInst;
                    newInst = new BinOpInst(inst.curBB, res, RISCV.BinaryOperator.xori, src, new ConstInt(-1));
                    newInst.isImmInst = true;
                    unaInst.linkNext(newInst);
                    unaInst.RMSelf();
                } else if (inst instanceof FuncCallInst) {
                    paras.clear();
                    FuncCallInst callInst = (FuncCallInst) inst;
                    if (callInst.thisPointer != null)
                        paras.add(callInst.thisPointer);
                    if (callInst.params != null)
                        paras.addAll(callInst.params);

                    // store or move params
                    for (int i = 8; i < paras.size(); i++) {
                        var para = paras.get(i);
                        Operand newpara = para;
                        if (para instanceof ConstString) {
                            newpara = new VirReg("para");
                            inst.linkPrev(new LA(inst.curBB, newpara, para));
                        }
                        if (para instanceof ConstInt) {
                            newpara = new VirReg("para");
                            inst.linkPrev(new LI(inst.curBB, (VirReg) newpara, (ConstInt) para));
                        }
                        inst.linkPrev(new StoreInst(inst.curBB, new StackLoc(func, false, i - 8), newpara, INTSIZE));
                        func.stacksize++;
                    }

                    for (int i = 0; i < Integer.min(8, paras.size()); i++) {
                        var para = paras.get(i);
                        var newpara = para;
                        if (para instanceof ConstString) {
                            newpara = new VirReg("para");
                            inst.linkPrev(new LA(inst.curBB, newpara, para));
                            inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a" + i), newpara));
                        }
                        else if (para instanceof ConstInt) {
                            if (((ConstInt) para).getVal() == 0) {
                                newpara = RISCV_Info.virtualPhyRegs.get("zero");
                                inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a" + i), newpara));
                            }
                            else {
                                newpara = new VirReg("para");
                                inst.linkPrev(new LI(inst.curBB, (VirReg) newpara, (ConstInt) para));
                                inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a" + i), newpara));
                            }
                        }
                        else
                            inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a" + i), paras.get(i)));
                    }
                    callInst.isRiscV = true;
                    // get ret val
                    if (!callInst.callTo.isVoid) {
                        inst.linkNext(new MoveInst(inst.curBB, callInst.res, RISCV_Info.virtualPhyRegs.get("a0")));
                        callInst.res = null;
                    }
                } else if (inst instanceof StoreInst) {
                    ((StoreInst) inst).byteSize = INTSIZE;
                    var stInst = (StoreInst) inst;
                    if ((stInst.res instanceof ConstInt)) {
                        VirReg tmp = new VirReg("_t");
                        stInst.linkPrev(new LI(stInst.curBB, tmp, (ConstInt) stInst.res));
                        stInst.res = tmp;
                    }
                    if (stInst.storeTo instanceof Variable) {
                        VirReg tmpReg = new VirReg("_lobits");
                        stInst.linkPrev(new LUI(stInst.curBB, tmpReg, stInst.storeTo));
                        stInst.helper = tmpReg;
//                        stInst.helper = new VirReg("why");
                    } else {
                        var stTo = stInst.storeTo;
                        var defInst = stTo.defInst;
                        if (stTo.usedInstructions.size() == 1 && defInst instanceof BinOpInst) {
                            if (((BinOpInst) defInst).rhs instanceof ConstInt) {
                                stInst.storeTo = ((BinOpInst) defInst).lhs;
                                stInst.offset = ((ConstInt) ((BinOpInst) defInst).rhs).getVal();
                                defInst.RMSelf();
                            } else if (((BinOpInst) defInst).rhs.name.equals("zero")) {
                                stInst.storeTo = ((BinOpInst) defInst).lhs;
                                defInst.RMSelf();
                            }
                        }
                        stInst.byteSize = INTSIZE;
                    }
                    if (stInst.res instanceof ConstString) {
                        VirReg tmp = new VirReg("_t");
                        stInst.linkPrev(new LA(stInst.curBB, tmp, stInst.res));
                        stInst.res = tmp;
                    }
                } else if (inst instanceof LoadInst) {
                    var loadInst = (LoadInst) inst;
                    if (loadInst.from instanceof Variable) {
                        VirReg tmpReg = new VirReg("ptr");
                        inst.linkPrev(new LA(inst.curBB, tmpReg, loadInst.from));
                        ((LoadInst) inst).from = tmpReg;
                        loadInst.byteSize = INTSIZE;
                    } else if (loadInst.from instanceof ConstString) {
                        inst.linkPrev(new LA(inst.curBB, loadInst.res, loadInst.from));
                        inst.RMSelf();
                    } else {
                        var from = loadInst.from;
                        var defInst = from.defInst;
                        if (from.usedInstructions.size() == 1 && defInst instanceof MoveInst) {
                            ((LoadInst) inst).from = ((MoveInst) defInst).moveFrom;
                            defInst.RMSelf();
                        } else if (from.usedInstructions.size() == 1 && defInst instanceof BinOpInst) {
                            if (((BinOpInst) defInst).rhs instanceof ConstInt) {
                                ((LoadInst) inst).from = ((BinOpInst) defInst).lhs;
                                ((LoadInst) inst).offset = ((ConstInt) ((BinOpInst) defInst).rhs).getVal();
                                defInst.RMSelf();
                            } else if (((BinOpInst) defInst).rhs.name.equals("zero")) {
                                ((LoadInst) inst).from = ((BinOpInst) defInst).lhs;
                                defInst.RMSelf();
                            }
                        }
                        loadInst.byteSize = INTSIZE;
                    }
                }  else if (inst instanceof MoveInst) {
                    var movInst = (MoveInst) inst;
                    if (movInst.moveFrom instanceof ConstString) {
                        inst.linkPrev(new LA(inst.curBB, movInst.moveTo, movInst.moveFrom));
                        inst.RMSelf();
                    } else if (movInst.moveFrom instanceof ConstInt) {
                        var tmp = getOpr(movInst.moveFrom, true, movInst);
                        if (tmp instanceof ConstInt) {
                            movInst.linkPrev(new LI(inst.curBB, (VirReg) movInst.moveTo, (ConstInt) tmp));
                            movInst.RMSelf();
                        } else
                            movInst.moveFrom = tmp;
                    }
                } else if (inst instanceof AllocaInst) {    // call malloc
                    var allocSize = ((AllocaInst) inst).getAllocSize();
                    if (allocSize instanceof ConstInt) {
                        var realAllocSize = getOpr(allocSize, true, inst);
                        if (realAllocSize instanceof ConstInt)
                            inst.linkPrev(new LI(inst.curBB, RISCV_Info.virtualPhyRegs.get("a0"), (ConstInt) realAllocSize));
                        else
                            inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a0"), realAllocSize));
                    } else
                        inst.linkPrev(new MoveInst(inst.curBB, RISCV_Info.virtualPhyRegs.get("a0"), ((AllocaInst) inst).getAllocSize()));
                    inst.linkNext(new MoveInst(inst.curBB, inst.getDefReg(), RISCV_Info.virtualPhyRegs.get("a0")));
                    ((AllocaInst) inst).reg = null;
                    ((AllocaInst) inst).allocSize = null;
                } else if (inst instanceof BranchInst) {
                    var bInst = (BranchInst) inst;
                    var trueBB = bInst.trueBB;
                    var elseBB = bInst.elseBB;
                    Instruction defInst = bInst.cond.defInst;
                    if (defInst instanceof CmpInst) {
                        var cmpInst = (CmpInst) bInst.cond.defInst;
                        if (cmpInst.getDefReg().usedInstructions.size() == 1) {
                            var lhs = getOpr(cmpInst.lhs, false, bInst);
                            var rhs = getOpr(cmpInst.rhs, false, bInst);
                            cmpInst.lhs = lhs;
                            cmpInst.rhs = rhs;
                            bInst.condInst = cmpInst;
                            cmpInst.RMSelf();
                        }
                    } else {
                        bInst.condInst = null;
                    }
                    inst.linkNext(new JumpInst(inst.curBB, elseBB));
                }
            }
        }
    }
}