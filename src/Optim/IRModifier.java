package Optim;

import IR.Function;
import IR.IRPrinter;
import IR.Instruction.FuncCallInst;
import IR.Instruction.Instruction;
import IR.Module;
import IR.Operand.ConstInt;

// just some stupid optimize
public class IRModifier extends Optimizer {

    public IRModifier(Module program) {
        super(program);
    }

    IRPrinter irPrinter = new IRPrinter(System.out);
    @Override
    public boolean run() {
        defUseCalC();
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func)) {
                run(func);
            }
        }
        return false;
    }

    private void defUseCalC(){
        // clear def-use info
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            func.getReversePostOrderBBs().forEach(basicBlock -> {
                for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                    var def = inst.getDefReg();
                    if (def != null) {
                        def.defInst = null;
                        def.usedInstructions.clear();
                    }
                }
            });
        }

        // calc
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            func.getReversePostOrderBBs().forEach(basicBlock -> {
                for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                    var def = inst.getDefReg();
                    if (def != null)
                        def.defInst = inst;
                    var usedRegs = inst.getUseRegs();
                    if (usedRegs != null) {
                        for (var use : usedRegs) {
                            if (use instanceof ConstInt || use == null) continue;
                            use.usedInstructions.add(inst);
                        }
                    }
                }
            });
        }
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
                                ((FuncCallInst) useInst).callTo = program.getGlobalFunction("printInt");
                                ((FuncCallInst) useInst).params.set(0, ((FuncCallInst) inst).params.get(0));
                                inst.RMSelf();
                                irPrinter.visit(program);
                            }
                            if (useInst instanceof FuncCallInst && ((FuncCallInst) useInst).getCallTo().getFuncname().equals("println")) {
                                ((FuncCallInst) useInst).callTo = program.getGlobalFunction("printlnInt");
                                ((FuncCallInst) useInst).params.set(0, ((FuncCallInst) inst).params.get(0));
                                inst.RMSelf();
                                irPrinter.visit(program);
                            }
                        }
                    }
                }
            }
        }
    }


}
