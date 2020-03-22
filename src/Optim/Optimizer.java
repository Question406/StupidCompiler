package Optim;

import IR.Module;

public class Optimizer {
    public Module program;
    public SSAConstructor ssaConstructor;
    public CFGSimplifier cfgSimplifier;

    public Optimizer(Module program) {
        this.program = program;
        ssaConstructor = new SSAConstructor(program);
        cfgSimplifier = new CFGSimplifier(program);
    }
}
