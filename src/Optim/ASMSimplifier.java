package Optim;

import IR.Function;
import IR.IRPrinter;
import IR.Instruction.Instruction;
import IR.Instruction.StoreInst;
import IR.Module;
import RISCV.RISCV_Info;

public class ASMSimplifier extends Optimizer {
    public ASMSimplifier(Module program) {
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

    IRPrinter irPrinter = new IRPrinter(System.err);

    private void run(Function func) {
        boolean thisChanged = true;
        while (thisChanged) {
            thisChanged = false;
            defUseCalC(func);
            for (var bb : func.getReversePostOrderBBs()) {
                Instruction nxtInst = null;
                for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                    nxtInst = inst.next;
                    if (inst instanceof StoreInst || inst.getDefReg() == null)
                        continue;
                    if (inst.getDefReg().usedInstructions.size() == 0) {
                        if (RISCV_Info.virtualPhyRegs.containsValue(inst.getDefReg()))
                            continue;
                        thisChanged = true;
                        System.out.println("asm worked");
                        inst.RMSelf();
                    }
                }
            }
        }
    }
}
