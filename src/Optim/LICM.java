package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.VirReg;

import java.util.*;

// loop invariant code motion, based on Tiger book
// as we're doing LICM in SSA form, each virReg has only one def
// a loop invariant is either a constant or its only defInst not in the loop
public class LICM extends Optimizer {
    AliasAnalysis aliasAnalysis = null;
    LoopAnalysis loopAnalysis = null;

    Set<Operand> invariants = new HashSet<>();
    Boolean thisChanged = true;

    IRPrinter irPrinter = new IRPrinter(System.out);

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
        while (thisChanged) {
            thisChanged = false;
            defUseCalC(func);
            loopAnalysis.run(func);
            invariants.clear();


            // working on loop
            for (var header : loopAnalysis.Headers) {
                findInvariant(header);
                hoist(header);
                if (thisChanged)
                    break;
            }
            func.CalcReversePostOrderBBs();
//            irPrinter.visit(func);
        }
    }

    private void findInvariant(BasicBlock header) {
        for (var BB : loopAnalysis.loopGroups.get(header)) {
            for (var inst = BB.insthead; inst != null; inst = inst.next)
                if(inst instanceof BinOpInst || inst instanceof MoveInst || inst instanceof UnaryOpInst) { // without alias analysis, LICM only works on these
                    if (inst.getDefReg() == null)
                        continue;

                    boolean flag = true;
                    for (var use : inst.getUseRegs()) { // skips immediate and string
                        if (!checkInvariant(use, header)) {
                            flag = false;
                            break;
                        }
                    }
                    if (flag) {
                        invariants.add(inst.getDefReg());
                    }
                }
        }
    }

    boolean checkInvariant(Operand reg, BasicBlock header){
        if (reg.defInst == null) return true; // global
        return      invariants.contains(reg)    // already invariant
                || !loopAnalysis.loopGroups.get(header).contains(reg.defInst.curBB); // no def in the loop
    }

    private void hoist(BasicBlock header) {
        if (invariants.size() != 0) {
            var preHeader = new BasicBlock(header.getFunc(), "pre_" + header.name);
            preHeader.addInst(new JumpInst(preHeader, header));
            ArrayList<BasicBlock> toRM = new ArrayList<>();
            for (var pred : header.predBBs)
                if (!loopAnalysis.loopGroups.get(header).contains(pred)) {
                    pred.newJumpTo(header, preHeader);
                    toRM.add(pred);
                }
            preHeader.succBBs.add(header);
            header.predBBs.add(preHeader);
            header.predBBs.removeAll(toRM);
            // modify phi insts
            for (var inst = header.insthead; inst instanceof PhiInst; inst = inst.next) {
                Map<BasicBlock, Operand> pathInPreHeader = new LinkedHashMap<>();
                Map<BasicBlock, Operand> pathInHeader = new LinkedHashMap<>();
                for (var entry : ((PhiInst) inst).from.entrySet()) {
                    var pre = entry.getKey();
                    if (!loopAnalysis.loopGroups.get(header).contains(pre)) // outside loop
                        pathInPreHeader.put(entry.getKey(), entry.getValue());
                    else pathInHeader.put(entry.getKey(), entry.getValue());
                }

                var tmp = new VirReg("hi_" + ((PhiInst) inst).res.name);
                var newPhi = new PhiInst(preHeader, tmp);
                preHeader.insttail.linkPrev(newPhi);
                newPhi.from = pathInPreHeader;
                if (newPhi.from.size() == 1) {
                    var movefrom = newPhi.from.values().iterator().next();
                    if (movefrom == null)
                        movefrom = new ConstInt(0);
                    newPhi.linkPrev(new MoveInst(newPhi.curBB, newPhi.res, movefrom));
                    newPhi.RMSelf();
                }

                pathInHeader.put(preHeader, tmp);
                ((PhiInst) inst).from = pathInHeader;
            }
            // hoisting
            for (var reg : invariants) {
                var defInst = reg.defInst;
                defInst.RMSelf();
                System.out.println("licm worked");
                preHeader.insttail.linkPrev(defInst);
            }
            changed = thisChanged = true;
        }
    }
}
