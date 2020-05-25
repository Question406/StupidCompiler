package BackEnd;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Optim.LoopAnalysis;
import RISCV.PhyReg;
import RISCV.RISCV_Info;
import RISCV.StackLoc;

import java.util.*;

import static RISCV.BinaryOperator.addi;

public class RegAllocater {
    final int MAXDEGREE = 1000000000;
    final int K = RISCV_Info.AllocableRegister.length;

    private Set<PhyReg> colors = new HashSet<PhyReg>();

    Module program;
    IRPrinter irPrinter;

    Function curFunc;
    Set<VirReg> initial = new HashSet<VirReg>();
    Set<VirReg> precoloured = new HashSet<VirReg>();
    Set<VirReg> simplifyWorkList = new HashSet<VirReg>();
    Set<VirReg> freezeWorkList = new HashSet<VirReg>();
    Set<VirReg> spillWorkList = new HashSet<VirReg>();
    Set<VirReg> spilledNodes = new HashSet<VirReg>();
    Set<VirReg> coalescedNodes = new HashSet<VirReg>();
    Set<VirReg> colouredNodes = new HashSet<VirReg>();

    Set<MoveInst> workListMoves = new HashSet<MoveInst>();
    Set<MoveInst> activeMoves = new HashSet<MoveInst>();
    Set<MoveInst> coalescedMoves = new HashSet<MoveInst>();
    Set<MoveInst> constrainedMoves = new HashSet<MoveInst>();
    Set<MoveInst> frozenMoves = new HashSet<MoveInst>();

    Stack<VirReg> selectStack = new Stack<VirReg>();

    Set<Edge> adjSet = new HashSet<Edge>();
    LoopAnalysis loopAnalysis = null;

    ASMPrinter asmPrinter;

    public RegAllocater(Module program, LoopAnalysis loopAnalysis) {
        this.program = program;
        this.irPrinter = new IRPrinter(System.out);
        this.loopAnalysis = loopAnalysis;
        asmPrinter = new ASMPrinter(System.out);
        colors.clear();
        for (var name : RISCV_Info.AllocableRegister)
            colors.add(RISCV_Info.physicalRegs.get(name));
    }

    public void run() {
        program.getGlobalFuncMap().forEach((name, func) -> {
            if (!Function.isBuiltIn(func)) {
                curFunc = func;
                RMredundantMove();
//                asmPrinter.visit(program);
                inner_run();
                RMredundantMove();
            }
        });

        program.getGlobalFuncMap().forEach((name, func) -> {
            renameVirReg(func);
            SP_insert(func);
//            peephole(func);
        });
    }

    private void peephole(Function func) {
        for(var BB : func.getReversePostOrderBBs()){
            Instruction nxtInst = null;
            for(var inst = BB.insthead; inst != null; inst = nxtInst){
                nxtInst = inst.next;
                if (inst instanceof LoadInst) {
                    var prevInst = inst.prev;
                    if (prevInst instanceof StoreInst && ((StoreInst) prevInst).storeTo.name.equals(((LoadInst) inst).from.name) && ((StoreInst) prevInst).offset == ((LoadInst) inst).offset) {
                        if (((StoreInst) prevInst).storeTo instanceof StackLoc)
                            continue;
                        if (((StoreInst) prevInst).res.name != ((LoadInst) inst).res.name)
                            inst.linkPrev(new MoveInst(inst.curBB, ((LoadInst) inst).res, ((StoreInst) prevInst).res));
                        inst.RMSelf();
                        System.out.println("peephole workded");
//                    }
                    } else if (prevInst instanceof LoadInst && (((LoadInst) prevInst).from.name.equals(((LoadInst) inst).from.name) && ((LoadInst) prevInst).offset == ((LoadInst) inst).offset)) {
//                if (prevInst instanceof LoadInst && (((LoadInst) prevInst).from.name.equals(((LoadInst) inst).from.name) && ((LoadInst) prevInst).offset == ((LoadInst) inst).offset)) {
                        if (((LoadInst) inst).from instanceof StackLoc || ((LoadInst) prevInst).from instanceof StackLoc || ((LoadInst) prevInst).res.name.equals(((LoadInst) inst).from.name))
                            continue;
                        if (((LoadInst) prevInst).res.name != ((LoadInst) inst).res.name)
                            inst.linkPrev(new MoveInst(inst.curBB, ((LoadInst) inst).res, ((LoadInst) prevInst).res));
                        inst.RMSelf();
                        System.out.println("peephole worked");
                    }
                }
            }
        }
    }

    private void SP_insert(Function func) {
        if (func.stacksize != 0) {
            int stackSize = func.stacksize * 4;
            stackSize = stackSize + (16 - stackSize % 16);
            BinOpInst newBinOP = new BinOpInst(func.entryBB, RISCV_Info.virtualPhyRegs.get("sp"), addi, RISCV_Info.virtualPhyRegs.get("sp"), new ConstInt(-stackSize));
            newBinOP.isImmInst = true;
            func.entryBB.insthead.linkPrev(newBinOP);
            newBinOP = new BinOpInst(func.entryBB, RISCV_Info.virtualPhyRegs.get("sp"), addi, RISCV_Info.virtualPhyRegs.get("sp"), new ConstInt(stackSize));
            func.exitBB.insttail.linkPrev(newBinOP);
        }
    }

    private void renameVirReg(Function func) {
        var RPOBBs = func.getReversePostOrderBBs();
        RPOBBs.forEach(bb->{
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                for (var use : inst.Use)
                    if (use.color != null)
                        use.name = use.color.name;
                for (var def : inst.Def)
                    if (def.color != null)
                        def.name = def.color.name;
            }
        });
    }

    private void RMredundantMove() {
        for (BasicBlock bb : curFunc.getReversePostOrderBBs()) {
            Instruction nxtInst;
            for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                if (inst instanceof MoveInst) {
                    VirReg moveTo = (VirReg) ((MoveInst) inst).moveTo;
                    VirReg moveFrom = (VirReg) ((MoveInst) inst).moveFrom;
//                    if (((MoveInst) inst).moveTo == ((MoveInst) inst).moveFrom)
                    if (moveTo.color != null && moveTo.color == moveFrom.color)
                        inst.RMSelf();
                }
            }
        }
    }

    private void init() {
        initial.clear();
        precoloured.clear();
        simplifyWorkList.clear();
        freezeWorkList.clear();
        spilledNodes.clear();
        spillWorkList.clear();
        workListMoves.clear();
        colouredNodes.clear();
        selectStack.clear();
        constrainedMoves.clear();
        coalescedNodes.clear();
        coalescedMoves.clear();
        frozenMoves.clear();
        activeMoves.clear();
        adjSet.clear();

        DefUseCalc();
        var RPOBBs = curFunc.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                initial.addAll(inst.Def);
                initial.addAll(inst.Use);
            }
        }

        precoloured.addAll(RISCV_Info.virtualPhyRegs.values());
        initial.removeAll(precoloured);

        for (var vreg : initial) {
            vreg.alias = null;
            vreg.degree = 0;
            vreg.spillCost = 0;
            vreg.adjList.clear();
            vreg.moveList.clear();
            vreg.color = null;
            vreg.stackLoc = null;
        }
        for (var precolor : precoloured) {
            precolor.degree = MAXDEGREE;
            precolor.spillCost = 0;
            precolor.adjList.clear();
            precolor.moveList.clear();
            precolor.stackLoc = null;
            precolor.alias = null;
        }
        calcSpillCost();
    }

    private void DefUseCalc() {
        var RPOBBs = curFunc.getReversePostOrderBBs();
        RPOBBs.forEach(bb->{
            for (var inst = bb.insthead; inst != null; inst = inst.next)
                inst.CalcDefUseSet();
        });
    }

    private void inner_run() {
        init();
        livenessAnalysis();
        build();
        makeWorkList();
        do {
            if (!simplifyWorkList.isEmpty())
                simplify();
            else if (!workListMoves.isEmpty())
                coalesce();
            else if (!freezeWorkList.isEmpty())
                freeze();
            else if (!spillWorkList.isEmpty())
                selectSpill();
        } while (!(simplifyWorkList.isEmpty() && workListMoves.isEmpty()
                && freezeWorkList.isEmpty() && spillWorkList.isEmpty()));
        assignColors();
        if (!spilledNodes.isEmpty()) {
            System.err.println(curFunc.getFuncname());
            for (var spill : spilledNodes) {
                System.err.println(spill);
            }
            rewriteProgram(curFunc);
            inner_run();
        }
    }

    private void calcSpillCost(){
        for (var bb : curFunc.getReversePostOrderBBs()) {
            int level = loopAnalysis.loopLevel(bb);
            int unit = (int) Math.pow(10, level);
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                for (var use : inst.Use) {
                    use.spillCost += unit;
                }
                for (var def : inst.Def) {
                    def.spillCost += unit;
                }
            }
        }
    }

    private void livenessAnalysis() {
        var RPOBBs = curFunc.getReversePostOrderBBs();
        for (var basicBlock : RPOBBs) {
            basicBlock.gen.clear();
            basicBlock.kill.clear();
            basicBlock.LiveIn.clear();
            basicBlock.LiveOut.clear();
            for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                var tmp = new HashSet<>(inst.Use);
                tmp.removeAll(basicBlock.kill);
                basicBlock.gen.addAll(tmp);
                var def = inst.Def;
                basicBlock.kill.addAll(def);
            }
        }

        boolean changed = true;
        while (changed) {
            changed = false;
            for (var bb : RPOBBs) {
                Set<VirReg> newOut = new HashSet<VirReg>();
                Set<VirReg> newIn = new HashSet<VirReg>(bb.LiveOut);
                newIn.removeAll(bb.kill);
                newIn.addAll(bb.gen);
                for (var succ : bb.succBBs)
                    newOut.addAll(succ.LiveIn);
                if (!(bb.LiveIn.equals(newIn) && bb.LiveOut.equals(newOut))) {
                    changed = true;
                    bb.LiveIn = newIn;
                    bb.LiveOut = newOut;
                }
            }
        }
    }

    private void build() {
        var RPOBBs = curFunc.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            Set<VirReg> live = new HashSet<VirReg>(bb.LiveOut);
            // reverse order
            for (var inst = bb.insttail; inst != null; inst = inst.prev) {
                if (inst instanceof MoveInst) {
                    live.removeAll(inst.Use);
                    for (var n : inst.Def)
                        n.moveList.add((MoveInst) inst);
                    for (var n : inst.Use)
                        n.moveList.add((MoveInst) inst);
                    workListMoves.add((MoveInst) inst);
                }
                live.addAll(inst.Def);
                live.add(RISCV_Info.virtualPhyRegs.get("zero"));
                for (var d : inst.Def)
                    for (var l : live)
                        addEdge(l, d);
                live.removeAll(inst.Def);
                live.addAll(inst.Use);
            }
        }
    }

    private void makeWorkList() {
        for (var n : initial) {
            if (n.degree >= K)
                spillWorkList.add(n);
            else if (MoveRelated(n))
                freezeWorkList.add(n);
            else
                simplifyWorkList.add(n);
        }
    }

    private boolean MoveRelated(VirReg n) {
        return !NodeMoves(n).isEmpty();
    }

    private Set<MoveInst> NodeMoves(VirReg n) {
//        Set<MoveInst> res = new HashSet<>(n.moveList);
//        Set<MoveInst> tmp = new HashSet<>(activeMoves);
////        Set<MoveInst> res = new HashSet<MoveInst>(workListMoves);
//        tmp.addAll(workListMoves);
//        res.retainAll(tmp);
////        res.addAll(activeMoves);
////        res.retainAll(n.moveList);
        var res = new HashSet<MoveInst>();
        for (var mov : n.moveList) {
            if (activeMoves.contains(mov) || workListMoves.contains(mov))
                res.add(mov);
        }
        return res;
    }

    private void simplify() {
        VirReg n = simplifyWorkList.iterator().next(); // choose the first one
        simplifyWorkList.remove(n);
        selectStack.push(n);
        for (var m : Adjacent(n)) {
            DecrementDegree(m);
        }
    }

    private Set<VirReg> Adjacent(VirReg n) {
        Set<VirReg> res = new HashSet<>(n.adjList);
        res.removeAll(selectStack);
        res.removeAll(coalescedNodes);
        return res;
    }

    private void DecrementDegree(VirReg m) {
        var d = m.degree;
        m.degree--;
        if (d == K) {
            Set<VirReg> tmp = new HashSet<VirReg>(Adjacent(m));
            tmp.add(m);
            EnableMoves(tmp);
            spillWorkList.remove(m);
            if (MoveRelated(m))
                freezeWorkList.add(m);
            else
                simplifyWorkList.add(m);
        }
    }

    private void EnableMoves(Set<VirReg> nodes) {
        for (var n : nodes)
            for (var m : NodeMoves(n))
                if (activeMoves.contains(m)) {
                    activeMoves.remove(m);
                    workListMoves.add(m);
                }
    }

    private void AddWorkList(VirReg u) {
        if (! precoloured.contains(u) && ! MoveRelated(u) && u.degree < K) {
            freezeWorkList.remove(u);
            simplifyWorkList.add(u);
        }
    }

    private VirReg getAlias(VirReg n) {
        if (coalescedNodes.contains(n)) {
            var res = getAlias(n.alias);
            n.alias = res;
            return res;
        }
        else
            return n;
    }

    private void coalesce() {
        MoveInst m = workListMoves.iterator().next(); // get first
        var x = getAlias((VirReg) m.moveTo);
        var y = getAlias((VirReg) m.moveFrom);
        VirReg u, v;
        if (precoloured.contains(y)) {
            u = y;
            v = x;
        } else {
            u = x;
            v = y;
        }
        workListMoves.remove(m);
        if (u == v) {
            coalescedMoves.add(m);
            AddWorkList(u);
        } else if (precoloured.contains(v) || adjSet.contains(new Edge(u, v))) {
            constrainedMoves.add(m);
            AddWorkList(u);
            AddWorkList(v);
        } else {
            boolean tmpcond1 = true;
            for (var t : Adjacent(v))
                if (!OK(t, u)) {
                    tmpcond1 = false;
                    break;
                }
            Set<VirReg> tmpSet = new HashSet<VirReg>(Adjacent(u));
            tmpSet.addAll(Adjacent(v));
            boolean tmpcond2 = Conservative(tmpSet);
            if ((precoloured.contains(u) && tmpcond1) || (!precoloured.contains(u) && tmpcond2)) {
                coalescedMoves.add(m);
                Combine(u, v);
                AddWorkList(u);
            } else
                activeMoves.add(m);
        }
    }

    private boolean Conservative(Set<VirReg> nodes) {
        int k = 0;
        for (var n : nodes) {
            if (n.degree >= K)
                k++;
        }
        return k < K;
    }

    private boolean OK(VirReg t, VirReg r) {
        return t.degree < K || precoloured.contains(t) || adjSet.contains(new Edge(t, r));
    }

    private void Combine(VirReg u, VirReg v) {
        if (freezeWorkList.contains(v))
            freezeWorkList.remove(v);
        else
            spillWorkList.remove(v);
        coalescedNodes.add(v);
        v.alias = u;
        u.moveList.addAll(v.moveList);
        Set<VirReg> tmp = new HashSet<>();
        tmp.add(v);
        EnableMoves(tmp);
        for (var t : Adjacent(v)) {
            addEdge(t, u);
            DecrementDegree(t);
        }
        if (u.degree >= K && freezeWorkList.contains(u)) {
            freezeWorkList.remove(u);
            spillWorkList.add(u);
        }
    }

    private void freeze() {
        VirReg u = freezeWorkList.iterator().next();
        freezeWorkList.remove(u);
        simplifyWorkList.add(u);
        FreezeMoves(u);
    }

    private void FreezeMoves(VirReg u) {
        for (var m : NodeMoves(u)) {
            var x = getAlias((VirReg) m.moveTo);
            var y = getAlias((VirReg) m.moveFrom);
            VirReg v = (y == getAlias(u)) ? x : y;
            activeMoves.remove(m);
            frozenMoves.add(m);
            if (freezeWorkList.contains(v) && NodeMoves(v).isEmpty()) {
                freezeWorkList.remove(v);
                simplifyWorkList.add(v);
            }
        }
    }


    private void selectSpill() {
        var m = selectStrategy();
        spillWorkList.remove(m);
        simplifyWorkList.add(m);
        FreezeMoves(m);
    }

    private VirReg selectStrategy() {
        if (spillWorkList.size() > 1100) {
            return spillWorkList.iterator().next();
        }
        else{
//            if (curFunc.funcname.equals("__init")) {
//                System.err.println("asdg");
//            }
            Iterator<VirReg> iterator = spillWorkList.iterator();
            VirReg m = null;
            while (iterator.hasNext()) {
                m = iterator.next();
                if (!m.addForSpill)
                    break;
            }
            while (iterator.hasNext()) {
                var tmp = iterator.next();
//                if (!tmp.addForSpill
//                        && (Math.abs(tmp.spillCost / tmp.degree - m.spillCost / m.degree) < 1e-3)
//                        && tmp.usedInstructions.size() < m.usedInstructions.size()) {
//                    m = tmp;
//                }
//                else
                if (!tmp.addForSpill && tmp.spillCost / tmp.degree < m.spillCost / m.degree)
                    m = tmp;
            }
//            if (m.name.equals("_i")) {
//                System.err.println("123");
//            }
            return m;
        }
    }

    private void assignColors() {
        while (!selectStack.empty()) {
            var n = selectStack.pop();
            Set<PhyReg> okColors = new HashSet<PhyReg>(colors);

            for (var w : n.adjList) {
                var tmpw = getAlias(w);
                if (colouredNodes.contains(tmpw) || precoloured.contains(tmpw)) {
                    okColors.remove(tmpw.color);
                }
            }
            if (okColors.isEmpty()) {
                spilledNodes.add(n);
            } else {
                colouredNodes.add(n);
                n.color = okColors.iterator().next();
                if (! RISCV_Info.phycallerSavedRegs.contains(n.color)) {
                    okColors.retainAll(RISCV_Info.phycallerSavedRegs);
                    if (!okColors.isEmpty())
                        n.color = okColors.iterator().next();
                }
            }
        }
        for (var n : coalescedNodes)
            n.color = getAlias(n).color;
    }

    private void rewriteProgram() {
        program.getGlobalFuncMap().forEach((s, func) -> {
            if (!Function.isBuiltIn(func))
                rewriteProgram(func);
        });
    }

    private boolean needSpill(Operand u) {
        if (u instanceof VirReg) {
            return ((VirReg) u).stackLoc != null;
        }
        return false;
    }

    private void rewriteProgram(Function func) {
        for (var v : spilledNodes) {
            v.stackLoc = new StackLoc(func, false, func.stacksize);
            func.stacksize++;
        }
        // StackSlot
        Map<VirReg, StackLoc> addr = new HashMap<VirReg, StackLoc>();
        var RPOBBs = func.getReversePostOrderBBs();
        for (var bb : RPOBBs) {
            Instruction nxtInst = null;
            for (var inst = bb.insthead; inst != null; inst = nxtInst) {
                nxtInst = inst.next;
                for (var use : inst.Use) {
                    if (needSpill(use)) {
                        VirReg tmp = new VirReg("spilluse");
                        tmp.addForSpill = true;
                        inst.linkPrev(new LoadInst(inst.curBB, tmp, use.stackLoc, 4));
                        inst.replaceUse(use, tmp);
                    }
                }
                for (var def : inst.Def) {
                    if (needSpill(def)) {
                        inst.linkNext(new StoreInst(inst.curBB, def.stackLoc, def, 4));
                    }
                }
            }
        }
    }
    private void addEdge(VirReg from, VirReg to) {
        if (from != to && ! adjSet.contains(new Edge(from, to))) {
            adjSet.add(new Edge(from, to));
            adjSet.add(new Edge(to, from));
            if (!precoloured.contains(from)) {
                from.adjList.add(to);
                ++from.degree;
            }
            if (!precoloured.contains(to)) {
                to.adjList.add(from);
                ++to.degree;
            }
        }
    }

    private class Edge {
        VirReg from;
        VirReg to;

        Edge(VirReg from, VirReg to) {
            this.from = from;
            this.to = to;
        }

        public boolean equals(Object obj) {
            if (obj instanceof Edge)
                return (from == ((Edge) obj).from && to == ((Edge) obj).to);
            else
                return false;
        }

        @Override
        public int hashCode() {
            return from.hashCode() ^ to.hashCode();
        }

        @Override
        public String toString() {
            return "Edge{" + "u:" + from +
                    ", v:" + to +
                    '}';
        }
    }
}

