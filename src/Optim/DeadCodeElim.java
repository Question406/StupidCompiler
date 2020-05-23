package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.ConstInt;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

// highlight:   Aggressive DCE described in <Engineering a Compiler> Keith. Cooper 10.2.2

public class DeadCodeElim extends Optimizer {
    public DeadCodeElim(Module program) {
        super(program);
    }

    boolean res;
    Set<Instruction> marked = new HashSet<Instruction>();
    Queue<Instruction> workList = new LinkedList<Instruction>();

    IRPrinter irPrinter;

    @Override
    public boolean run() {
        irPrinter = new IRPrinter(System.out);

        CalCDefUseChain();
        res = false;
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            run(func);
        }
//        if (res) {
//            CommonFunc.printlnAnything("DCE worked");
//        }
        return res;
    }

    private void run(Function func) {
        mark(func);
        sweep(func);
        func.CalcReversePostOrderBBs();
        marked.clear();
        workList.clear();
    }

    private void CalCDefUseChain() {
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

    private void mark(Function func) {
        func.getReversePostOrderBBs().forEach(bb -> {
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                if (isCritical(inst)) {
                    marked.add(inst);
                    workList.add(inst);
                }
            }
        });
        while (!workList.isEmpty()) {
            var inst = workList.poll();
            var usedRegs = inst.getUseRegs();
            if (usedRegs != null) {
                for (var use : usedRegs) {
                    if ((use instanceof ConstInt) || use == null) continue;
                    Instruction defInst = use.defInst;
                    if (defInst != null)
                        if (!marked.contains(defInst)) {
                            marked.add(defInst);
                            workList.add(defInst);
                        }
                }
            }
            if (inst instanceof PhiInst) { // for those phiInst like b = phi %b1: 0 %b2: 1
                for (var bb : ((PhiInst) inst).from.keySet()) {
                    Instruction bbtail = bb.insttail;
                    if (bbtail == null)
                        continue;
                    if (!marked.contains(bbtail)) {
                        marked.add(bbtail);
                        workList.add(bbtail);
                    }
                }
            }
            for (var bb : inst.curBB.PostDomFros) {
                Instruction bbtail = bb.insttail;
                if (bbtail == null)
                    continue;
                if (!marked.contains(bbtail)) {
                    marked.add(bbtail);
                    workList.add(bbtail);
                }
            }
        }
    }

    private void sweep(Function func) {
        func.getReversePostOrderBBs().forEach(basicBlock -> {
            Instruction nxtInst;
            for (var inst = basicBlock.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                if (!marked.contains(inst)) {
                    if (inst instanceof BranchInst) {
                        res = true;
                        basicBlock.removeTail();
                        var newJumpTo = getNearestMarkedBB(basicBlock);
                        if (newJumpTo == null) {
                            System.out.print("123");
                        }
                        basicBlock.succBBs.clear();
                        basicBlock.succBBs.add(newJumpTo);
                        basicBlock.endBB(new JumpInst(basicBlock, newJumpTo));
                    } else if (!(inst instanceof JumpInst)) {
                        res = true;
                        inst.RMSelf();
                    }
                }
            }
        });
    }

    private BasicBlock getNearestMarkedBB(BasicBlock basicBlock) {
        BasicBlock cur = basicBlock.PostIDom;
        while (cur != null) {
            for (var inst = cur.insthead; inst != null; inst = inst.next) {
                if (marked.contains(inst))
                    return cur;
            }
            cur = cur.PostIDom;
        }
        assert false;
        return null;
    }

    boolean isCritical(Instruction instruction) {
        return !(  instruction instanceof BinOpInst
                || instruction instanceof CmpInst
                || instruction instanceof UnaryOpInst
                || instruction instanceof BranchInst
                || instruction instanceof MoveInst
                || instruction instanceof PhiInst
                || instruction instanceof JumpInst);
    }
}
