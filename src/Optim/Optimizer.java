package Optim;

import IR.Module;

public abstract class Optimizer {
    public Module program;

    public Optimizer(Module program) {
        this.program = program;
    }

    abstract public boolean run();
}
