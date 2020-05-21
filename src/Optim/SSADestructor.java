package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.VirReg;

import java.util.*;

public class SSADestructor extends Optimizer {
    private class ParallelCopy {
        VirReg to;
        Operand from;
        ParallelCopy(VirReg to, Operand from) {
            this.to = to;
            this.from = from;
        }
    }

    Map<BasicBlock, List<ParallelCopy>> parallelCopyMap = new HashMap<BasicBlock, List<ParallelCopy>>();

    public SSADestructor(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        program.getGlobalFuncMap().values().forEach(func->{
            if (!Function.isBuiltIn(func)) {
                SplitCriticalEdge(func);
                func.CalcReversePostOrderBBs();
//                ReplaceParallelCopy(func);
                ModifyParallelCopy(func);
            }
        });
        return false;
    }

    private void SplitCriticalEdge(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
        RPOBBs.forEach(bb -> parallelCopyMap.computeIfAbsent(bb, list->new ArrayList<ParallelCopy>()));
        List<BasicBlock> preds = new ArrayList<BasicBlock>();
        Map<BasicBlock, List<ParallelCopy>> tmpMap = new HashMap<BasicBlock, List<ParallelCopy>>();
        for (var bb : RPOBBs) {
            tmpMap.clear(); preds.clear();
            preds.addAll(bb.predBBs);
            for (var pred : preds) {
                var paracopyBB = pred;
                if (pred.succBBs.size() > 1) {  // add split block for parallel copy
                    assert pred.insttail instanceof BranchInst;
                    // CFG modify
                    paracopyBB = new BasicBlock(func, "paracopy");
                    paracopyBB.endBB(new JumpInst(paracopyBB, bb));
                    ((BranchInst) pred.insttail).modifyBranch(bb, paracopyBB);
                    pred.succBBs.remove(bb);
                    pred.succBBs.add(paracopyBB);
                    paracopyBB.predBBs.add(pred);
                    paracopyBB.succBBs.add(bb);
                    bb.predBBs.remove(pred);
                    bb.predBBs.add(paracopyBB);
                    parallelCopyMap.computeIfAbsent(paracopyBB, list->new ArrayList<ParallelCopy>());
                }
                tmpMap.put(pred, parallelCopyMap.get(paracopyBB));
            }
            Instruction instruction = bb.insthead;
            while (instruction instanceof PhiInst) {
                for (var entry : ((PhiInst) instruction).from.entrySet()) {
                    var fromBB = entry.getKey();
                    var fromOpr = entry.getValue();
                    var res = ((PhiInst) instruction).res;
                    if (res != fromOpr) {
                        if (fromOpr == null)
                            fromOpr = new ConstInt(0);
                        tmpMap.get(fromBB).add(new ParallelCopy((VirReg) res, fromOpr));
                    }
                }
                instruction = instruction.next;
            }
            // remove phis
            bb.insthead = instruction;
            bb.insthead.prev = null;
        }
    }

    // Algorithm 17.6: Parallel copy sequentialization algorithm in SSAbook p265
    private void ReplaceParallelCopy(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
        Queue<VirReg> ready = new LinkedList<VirReg>();
        Queue<VirReg> todo = new LinkedList<VirReg>();
        Map<VirReg, VirReg> pred = new HashMap<VirReg, VirReg>();
        Map<VirReg, VirReg> loc = new HashMap<>();
        for (var bb : RPOBBs) {
            ready.clear(); todo.clear(); pred.clear(); loc.clear();
            var PCs = parallelCopyMap.get(bb);
            VirReg tmp = new VirReg("breaker");

            // init
            pred.put(tmp, null);
            for (var pc : PCs) {
                if (pc.from instanceof VirReg) {
                    loc.put(pc.to, null);
                    pred.put((VirReg) pc.from, null);
                }
            }

            //
            for (var pc : PCs) {
                if (pc.from instanceof VirReg) {
                    var from = (VirReg) pc.from;
                    loc.put(from, from);
                    pred.put(pc.to, from);
                    todo.add(pc.to);
                }
            }

            for (var pc : PCs) {
                if (pc.from instanceof VirReg){
                    if (loc.get(pc.to) == null)
                        ready.add(pc.to);
                }
            }

            while (!todo.isEmpty()) {
                while (!ready.isEmpty()) {
                    var b = ready.poll();
                    var a = pred.get(b);
                    var c = loc.get(a);
                    bb.insttail.linkPrev(new MoveInst(bb, b, c));
                    loc.put(a, b);
                    if (a == c && pred.get(a) != null)
                        ready.add(a);
                }

                var b = todo.poll();
                if (b == loc.get(pred.get(b))) {
                    bb.insttail.linkPrev(new MoveInst(bb, tmp, b));
                    loc.put(b, tmp);
                    ready.add(b);
                }
            }

            for (var pc : PCs)
                if (pc.from instanceof ConstInt)
                    bb.insttail.linkPrev(new MoveInst(bb, pc.to, pc.from));
        }
    }

    private void ModifyParallelCopy(Function func) {
        for (var bb : func.getReversePostOrderBBs()) {
            if (!parallelCopyMap.containsKey(bb))
                continue;
            for (var pc : parallelCopyMap.get(bb)) {
                if (pc.from instanceof VirReg) {
                    if (pc.from != pc.to) {
                        bb.insttail.linkPrev(new MoveInst(bb, pc.to, pc.from));
                    } else {
                        VirReg newV = new VirReg("breaker");
                        bb.insttail.linkPrev(new MoveInst(bb, newV, pc.from));
                        bb.insttail.linkPrev(new MoveInst(bb, pc.to, newV));
                    }
                }
            }
            for (var pc : parallelCopyMap.get(bb)) {
                if (pc.from instanceof ConstInt)
                    bb.insttail.linkPrev(new MoveInst(bb, pc.to,pc.from));
            }
        }
    }

}
