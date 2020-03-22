package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.Instruction.BranchInst;
import IR.Instruction.JumpInst;
import IR.Module;

public class CFGSimplifier {
    Module program;

    public CFGSimplifier(Module program) {
        this.program = program;
    }

    public void run() {
        for (var func : program.getGlobalFuncMap().values())
            if (!Function.isBuiltIn(func))
                funcSimplify(func);
    }

    private void funcSimplify(Function function) {
        boolean changed = true;
        while (changed) {
            changed = false;
            // one pass
            var RPOBBs = function.getReversePostOrderBBs();
            for (var bb : RPOBBs) {
                if (bb.insttail instanceof BranchInst) {
                    BasicBlock bb1 = ((BranchInst) bb.insttail).trueBB;
                    BasicBlock bb2 = ((BranchInst) bb.insttail).elseBB;
                    if (bb1 == bb2) {
                        bb.removeTail();
                        bb.endBB(new JumpInst(bb, bb1));
                        changed = true;
                    }
                }

                if (bb.insttail instanceof JumpInst) {
                    BasicBlock jumpTo = ((JumpInst) bb.insttail).jumpTo;
                    if (bb.isEmpty()) {
                        changed = true;
                        for (var predbb : bb.predBBs)
                            predbb.newJumpTo(bb, jumpTo);
                        bb.RMSelf();
                    }

                    if (jumpTo.predBBs.size() == 1) {
                        changed = true;
                        bb.removeTail();
                        bb.CombineBB(jumpTo);
                    }

                    if (jumpTo.isEmpty() && jumpTo.insttail instanceof BranchInst) {
                        changed = true;
                        BranchInst oldBranch = (BranchInst) jumpTo.insttail;
                        BranchInst newBranchInst = new BranchInst(bb, oldBranch.cond, oldBranch.trueBB, oldBranch.elseBB);
                        bb.removeTail();
                        bb.endBB(newBranchInst);
                    }
                }
            }
            function.CalcReversePostOrderBBs();
        }
    }
}
