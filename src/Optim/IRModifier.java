package Optim;

import IR.Function;
import IR.Instruction.FuncCallInst;
import IR.Instruction.Instruction;
import IR.Module;

// just some stupid optimize
public class IRModifier extends Optimizer {

    public IRModifier(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func))
                run(func);
        }
        return false;
    }

    private void run(Function func) {
        for (var bb : func.getReversePostOrderBBs()) {
            Instruction nxtInst = null;
            for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                if (inst instanceof FuncCallInst) {
                    if (((FuncCallInst) inst).callTo.getFuncname().equals("toString")) {
                        var res = ((FuncCallInst) inst).res;
                        // optimize print(toString(int))
                        if (res.usedInstructions.size() == 1) {
                            var useInst = res.usedInstructions.iterator().next();
                            if (useInst instanceof FuncCallInst && ((FuncCallInst) useInst).getCallTo().getFuncname().equals("print")) {
                                ((FuncCallInst) useInst).callTo.funcname = "printInt";
                                ((FuncCallInst) useInst).params.set(0, ((FuncCallInst) inst).params.get(0));
                                inst.RMSelf();
                            }
                            if (useInst instanceof FuncCallInst && ((FuncCallInst) useInst).getCallTo().getFuncname().equals("println")) {
                                ((FuncCallInst) useInst).callTo.funcname = "printlnInt";
                                ((FuncCallInst) useInst).params.set(0, ((FuncCallInst) inst).params.get(0));
                                inst.RMSelf();
                            }
                        }
                    }
                }
            }
        }
    }


}