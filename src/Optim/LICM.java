package Optim;

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
        return false;
    }


}
