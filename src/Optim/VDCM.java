package Optim;

import IR.Module;

// highlight:   Value-Driven Code Motion Described in
//              TR96-308, the doctor thesis of Loren Taylor Simpson,
//              also student of Keith. Cooper

public class VDCM extends Optimizer {
    public VDCM(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        return false;
    }
}
