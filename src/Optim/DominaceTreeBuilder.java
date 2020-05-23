package Optim;

import IR.Function;
import IR.Module;

// highlight:   used to compute Dominance Tree && Reverse Dominance Tree

public class DominaceTreeBuilder extends Optimizer {
    public DominaceTreeBuilder(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        for (var function : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(function)) continue;
            function.CalcReversePostOrderBBs();
            ComputeIDomBB(function);
            ComputeDomFrontier(function);

            function.CalcReverseCFGPostOrderBBs();
            ComputePostIDomBB(function);
            ComputePostDomFros(function);
        }
        return false;
    }



}
