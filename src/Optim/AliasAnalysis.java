package Optim;

import IR.Function;
import IR.Instruction.AllocaInst;
import IR.Instruction.LoadInst;
import IR.Instruction.StoreInst;
import IR.Module;
import IR.Operand.Variable;
import IR.Operand.VirReg;

// a very weak alias analysis for IRs like mine
// since we didn't save type info in IR, so we have to recollect which virReg is a pointer

public class AliasAnalysis extends Optimizer {
    enum aliasStat {
        may, must, no
    }

    public AliasAnalysis(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func))
                run(func);
        }
        return false;
    }

    private void run(Function func) {
        collectPtrInfo(func);

    }

    private void collectPtrInfo(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
        for (var i = RPOBBs.size() - 1; i >= 0; i--) {
            var bb = RPOBBs.get(i);
            for (var inst = bb.insttail; inst != null; inst = inst.prev) {
                if (inst instanceof LoadInst) {
                    if (((LoadInst) inst).from instanceof Variable)
                        continue;
                    VirReg from = (VirReg) ((LoadInst) inst).from;
                    from.isPtr = true;
                    from.ptrLevel = 1;
                } else if (inst instanceof StoreInst) {
                    if (((StoreInst) inst).storeTo instanceof Variable)
                        continue;

                    VirReg storeto = (VirReg) ((StoreInst) inst).storeTo;
                    storeto.isPtr = true;
                    storeto.ptrLevel = 1;
                } else if (inst instanceof AllocaInst) {
                    ((VirReg) ((AllocaInst) inst).reg).isPtr = true;
                    ((VirReg) ((AllocaInst) inst).reg).ptrLevel = 1;
                }
            }
        }
    }
}
