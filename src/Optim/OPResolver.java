package Optim;

import IR.Function;
import IR.Instruction.BinOpInst;
import IR.Module;
import IR.Operand.ConstInt;
import Utils.BinaryOperator;

public class OPResolver extends Optimizer {
    public OPResolver(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func)) {
                run(func);
            }
        }
        return false;
    }

    private void run(Function func) {
        for (var bb : func.getReversePostOrderBBs()) {
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                if (inst instanceof BinOpInst) {
                    if (((BinOpInst) inst).op == BinaryOperator.MULTI) {
                        var lhs = ((BinOpInst) inst).lhs;
                        var rhs = ((BinOpInst) inst).rhs;
                        if (lhs instanceof ConstInt) {
                            if ((((ConstInt) lhs).getVal() & (((ConstInt) lhs).getVal() - 1)) == 0) {
                                int shift = (int) Math.floor(Math.log(((ConstInt) lhs).getVal()) / Math.log(2));
                                ((BinOpInst) inst).lhs = ((BinOpInst) inst).rhs;
                                ((BinOpInst) inst).rhs = new ConstInt(shift);
                                ((BinOpInst) inst).op = BinaryOperator.LEFTSHIFT;
                            }
                        } else if (((BinOpInst) inst).rhs instanceof ConstInt) {
                            if ((((ConstInt) rhs).getVal() & (((ConstInt) rhs).getVal() - 1)) == 0) {
                                int shift = (int) Math.floor(Math.log(((ConstInt) rhs).getVal()) / Math.log(2));
                                ((BinOpInst) inst).rhs = new ConstInt(shift);
                                ((BinOpInst) inst).op = BinaryOperator.LEFTSHIFT;
                            }
                        }
                    }
                    if (((BinOpInst) inst).op == BinaryOperator.DIV) {
                        var rhs = ((BinOpInst) inst).rhs;
                        if (rhs instanceof ConstInt) {
                            if ((((ConstInt) rhs).getVal() & (((ConstInt) rhs).getVal() - 1)) == 0) {
                                int shift = (int) Math.floor(Math.log(((ConstInt) rhs).getVal()) / Math.log(2));
                                ((BinOpInst) inst).rhs = new ConstInt(shift);
                                ((BinOpInst) inst).op = BinaryOperator.RIGHTSHIFT;
                            }
                        }
                    }
                    if (((BinOpInst) inst).op == BinaryOperator.MOD) {
                        var rhs = ((BinOpInst) inst).rhs;
                        if (rhs instanceof ConstInt) {
                            if ((((ConstInt) rhs).getVal() & (((ConstInt) rhs).getVal() - 1)) == 0) {
                                int shift = ((ConstInt) rhs).getVal() - 1;
                                ((BinOpInst) inst).rhs = new ConstInt(shift);
                                ((BinOpInst) inst).op = BinaryOperator.LOGICAND;
                            }
                        }
                    }
                }
            }
        }
    }
}
