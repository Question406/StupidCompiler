package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.BranchInst;
import IR.Instruction.JumpInst;
import IR.Instruction.PhiInst;
import IR.Module;
import IR.Operand.ConstInt;

import java.util.ArrayList;


public class CFGSimplifier extends Optimizer {
    IRPrinter irPrinter;

    public CFGSimplifier(Module program) {
        super(program);
        irPrinter = new IRPrinter(System.out);
    }

    public boolean run() {
        boolean res = false;
        for (var func : program.getGlobalFuncMap().values())
            if (!Function.isBuiltIn(func))
                res |= funcSimplify(func);
        return res;
    }

    private boolean funcSimplify(Function function) {
        boolean res = false;
        boolean changed = true;
        while (changed) {
            // one pass
            changed = false;
            // branch simplify
            changed |= branchSimplify(function);
            // jump simplify
            changed |= emptyBBElem(function);
            changed |= mergeConsecutiveBB(function);
            changed |= branchFloatUp(function);
            if (changed)
                res = true;
        }
        if (res) {
            unreachableBBElem(function);
            function.CalcReverseCFGPostOrderBBs();
        }
        return res;
    }

    private boolean branchSimplify(Function function) {
        boolean res = false;
        var RPOBBs = function.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            var inst = bb.insttail;
            if (inst instanceof BranchInst) {
                var cond = ((BranchInst) inst).cond;
                var trueBB = ((BranchInst) inst).trueBB;
                var elseBB = ((BranchInst) inst).elseBB;
                BasicBlock toRMBB = null;
                if (trueBB == elseBB) {
                    bb.removeTail();
                    bb.endBB(new JumpInst(bb, trueBB));
                }
                if (cond instanceof ConstInt) {
                    if (((ConstInt) cond).getVal() == 1) {
                        ((BranchInst) inst).elseBB = trueBB;
                        toRMBB = elseBB;
                    }
                    else {
                        ((BranchInst) inst).trueBB = elseBB;
                        toRMBB = trueBB;
                    }
                }
                if (((BranchInst) inst).trueBB == ((BranchInst) inst).elseBB) {
                    if (toRMBB != null) {
                        toRMBB.predBBs.remove(bb);
                        bb.succBBs.remove(toRMBB);
                        // modify Phi Insts since we can know for sure no data flows form bb to toRMBB
                        for (var toRMBBinst = toRMBB.insthead; toRMBBinst instanceof PhiInst; toRMBBinst = toRMBBinst.next)
                            ((PhiInst) toRMBBinst).rmFrom(bb);
                    }
                    bb.removeTail();
                    bb.endBB(new JumpInst(bb, ((BranchInst) inst).trueBB));
                    res = true;
                }
            }
        }
        function.CalcReversePostOrderBBs();
        return res;
    }

    private boolean emptyBBElem(Function function) {
        boolean changed = false;
        var RPOBBs = function.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            var inst = bb.insttail;
            if (inst instanceof JumpInst) {
                var jumpTo = ((JumpInst) inst).jumpTo;
                if (bb.isEmpty()) {
                    if (bb != function.entryBB) {
                        boolean canMerge = true;
                        // highlight: if some phi nodes need data flow from bb, this bb can't be merged
                        for (var succBB : bb.succBBs) {
                            for (var succinst = succBB.insthead; succinst instanceof PhiInst; succinst = succinst.next)
                                if (((PhiInst) succinst).from.containsKey(bb)) {
                                    canMerge =false;
                                    break;
                                }
                        }
                        if (canMerge) {
                            changed = true;
                            for (var predBB : bb.predBBs)
                                predBB.newJumpTo(bb, jumpTo);
                            bb.predBBs.clear();
                            bb.succBBs.clear();
                        }
                    }
                }
            }
        }
        function.CalcReversePostOrderBBs();
        return changed;
    }

    private boolean mergeConsecutiveBB(Function function) {
        boolean changed = false;
        var RPOBBs = function.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            var inst = bb.insttail;
            if (inst instanceof JumpInst) {
                var jumpTo = ((JumpInst) inst).jumpTo;
                if (jumpTo.predBBs.size() == 1) {
                    changed = true;
                    bb.removeTail();
                    bb.CombineBB(jumpTo);                   // Combine insts
                    jumpTo.predBBs.remove(bb);
                    bb.succBBs.remove(jumpTo);

                    jumpTo.succBBs.forEach(succBB -> {
                        bb.succBBs.add(succBB);
                        succBB.predBBs.remove(jumpTo);
                        succBB.predBBs.add(bb);
                    });
                }
            }
        }
        function.CalcReversePostOrderBBs();
        return changed;
    }

    private boolean branchFloatUp(Function function) {
        boolean changed = false;
        var RPOBBs = function.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            var inst = bb.insttail;
            if (inst instanceof JumpInst) {
                var jumpTo = ((JumpInst) inst).jumpTo;
                if (jumpTo.isEmpty() && jumpTo.insttail instanceof BranchInst) {
                    changed = true;
                    BranchInst oldBranch = (BranchInst) jumpTo.insttail;
                    BranchInst newBranchInst = new BranchInst(bb, oldBranch.cond, oldBranch.trueBB, oldBranch.elseBB);
                    bb.removeTail();
                    bb.endBB(newBranchInst);
                    for (var succBB : bb.succBBs) {
                        for (var succInst = succBB.insthead; succInst instanceof PhiInst; succInst = succInst.next) {
                            if (((PhiInst) succInst).from.containsKey(jumpTo))
                                ((PhiInst) succInst).replaceFrom(jumpTo, bb);
                        }
                    }
                    bb.succBBs.remove(jumpTo);
                    bb.succBBs.add(oldBranch.trueBB);
                    bb.succBBs.add(oldBranch.elseBB);
                }
            }
        }
        function.CalcReversePostOrderBBs();
        return changed;
    }

    private void unreachableBBElem(Function function) {
        var RPOBBs = function.getReversePostOrderBBs();
        RPOBBs.forEach(BB -> {
            ArrayList<BasicBlock> toRM = new ArrayList<BasicBlock>();
            for (var pred : BB.predBBs) {
                if (! (RPOBBs.contains(pred)))
                    toRM.add(pred);
            }
            BB.predBBs.removeAll(toRM);
            toRM.clear();
            for (var succ : BB.succBBs)
                if (! (RPOBBs.contains(succ)))
                    toRM.add(succ);
            BB.succBBs.removeAll(toRM);
            toRM.clear();
        });
    }
}
