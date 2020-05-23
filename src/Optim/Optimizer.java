package Optim;

import IR.Function;
import IR.Module;
import IR.Operand.ConstInt;

public abstract class Optimizer {
    public Module program;
    boolean changed;

    public Optimizer(Module program) {
        this.program = program;
    }

    abstract public boolean run();

    void defUseCalC(){
        // clear def-use info
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            func.getReversePostOrderBBs().forEach(basicBlock -> {
                for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                    var def = inst.getDefReg();
                    if (def != null) {
                        def.defInst = null;
                        def.usedInstructions.clear();
                    }
                }
            });
        }

        // calc
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            func.getReversePostOrderBBs().forEach(basicBlock -> {
                for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                    var def = inst.getDefReg();
                    if (def != null)
                        def.defInst = inst;
                    var usedRegs = inst.getUseRegs();
                    if (usedRegs != null) {
                        for (var use : usedRegs) {
                            if (use instanceof ConstInt || use == null) continue;
                            use.usedInstructions.add(inst);
                        }
                    }
                }
            });
        }
    }
}
