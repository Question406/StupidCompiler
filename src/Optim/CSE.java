package Optim;

// Dominator Tree Based CSE, spilt to two part, could enable us to use different numbering technique
// 1:   global numbering
// 2:   Common statement eliminate

import IR.Function;
import IR.Instruction.Instruction;
import IR.Module;

import java.util.HashMap;
import java.util.Map;

public class CSE extends Optimizer {
    Map<Integer, Instruction> exprMap = new HashMap<>();

    public CSE(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        numbering();
        eliminate();
        return false;
    }

    // numbering
    private void numbering() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func))
                numbering(func);
        }
    }

    private void eliminate() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func))
                eliminate(func);
        }
    }

    private void numbering(Function func) {

    }

    private void eliminate(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
        RPOBBs.forEach(bb->{

        });
    }

}
