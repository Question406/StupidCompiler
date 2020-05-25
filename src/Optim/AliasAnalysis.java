package Optim;

import IR.Function;
import IR.Instruction.AllocaInst;
import IR.Instruction.LoadInst;
import IR.Instruction.StoreInst;
import IR.Module;
import IR.Operand.Variable;
import IR.Operand.VirReg;

// a very very very weak alias analysis for IRs like mine
// since we didn't save type info in IR, we have to recollect which virReg is a pointer
// only do redundant load elimination in a single BB
// intends to work on following situation
// define i32 @__init   {
//        %__init.entryBB1:
//        %_t1.0  = alloc  4
//        %_a1.0  = move  %_t1.0
//        %_t2.0  = alloc  8
//        %_t3.0  =   add  %_a1.0   0
//        store  %_t3.0   %_t2.0
//        %_t4.0  =   add  %_a1.0   0
//        %_t5.0  = load  %_t4.0
//        %_t6.0  =   add  %_t5.0   0
//        store  %_t6.0   10
//        %_t7.0  =   add  %_a1.0   0
//        %_t8.0  = load  %_t7.0  (kill)
//        %_t9.0  =   add  %_t5.0   4
//        store  %_t9.0   20
//        %_t10.0  =   add  %_a1.0   0
//        %_t11.0  = load  %_t10.0
//        %_t12.0  =   add  %_t11.0   4
//        %_t13.0  =   add  %_a1.0   0
//        %_t14.0  = load  %_t13.0
//        %_t15.0  =   add  %_t14.0   0
//        %_t16.0  = load  %_t15.0
//        %_t17.0  = load  %_t12.0
//        %_t18.0  =   add  %_t16.0   %_t17.0
//        %t1.0  = move  %_t18.0
//        ret  %t1.0
//
//        }

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

        for (var bb : func.getReversePostOrderBBs()) {
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                if (inst.getDefReg() != null) {

                }
            }
        }
    }


    private void collectPtrInfo(Function func) {
        // those virreg who was once a ptr either in a store || load is a pointer
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