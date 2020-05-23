package Optim;

import IR.Function;
import IR.Module;
import IR.Operand.VirReg;

import java.util.HashSet;
import java.util.Set;

// loop invariant code motion

public class LICM extends Optimizer {
    AliasAnalysis aliasAnalysis = null;
    LoopAnalysis loopAnalysis = null;

    Set<VirReg> invariants = new HashSet<VirReg>();

    public LICM(Module program, AliasAnalysis aliasAnalysis, LoopAnalysis loopAnalysis) {
        super(program);
        this.aliasAnalysis = aliasAnalysis;
        this.loopAnalysis = loopAnalysis;
    }

    @Override
    public boolean run() {
        changed = false;
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func)) {
                run(func);
            }
        }
        return changed;
    }

    private void run (Function func) {
        invariants.clear();

        var thisChanged = true;
        while (thisChanged) {
            thisChanged = false;

        }

    }
}
