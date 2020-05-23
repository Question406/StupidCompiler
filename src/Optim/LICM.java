package Optim;

import IR.Function;
import IR.Module;

// loop invariant code motion

public class LICM extends Optimizer {
    AliasAnalysis aliasAnalysis = null;
    LoopAnalysis loopAnalysis = null;

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

    }
}
