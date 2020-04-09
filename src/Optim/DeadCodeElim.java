package Optim;

import IR.Module;

public class DeadCodeElim extends Optimizer {
    public DeadCodeElim(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        return false;
    }
}
