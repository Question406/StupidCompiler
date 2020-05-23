package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Utils.BinaryOperator;
import Utils.UnaryOperator;

import java.util.*;


// highlight: dominator tree based value numbering, <Engineering a Compiler> Chap 10.5.2

public class DVNT extends Optimizer {
    boolean changed = false;
    Map<Operand, Operand> valMap = new HashMap<>();
    Map<Expr, Operand> ExprMap = new HashMap<>();
    Map<Map<BasicBlock, Operand>, VirReg> phiMap = new HashMap<>();

    IRPrinter irPrinter = new IRPrinter(System.out);

    public DVNT(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        changed = false;
        for (var func : program.getGlobalFuncMap().values()) {
            if (!Function.isBuiltIn(func))
                run(func);
        }
        valMap.clear();
        ExprMap.clear();
        return changed;
    }

    private void run(Function func){
        valMap.clear();
        ExprMap.clear();
        for (var global : program.getGlobalVar().values())
            valMap.put(global, global);
        for (var arg : func.args) valMap.put(arg, arg);
        if(func.thisPointer != null)
            valMap.put(func.thisPointer, func.thisPointer);

        run(func.entryBB);
    }

    private void run(BasicBlock curBB) {
        // allocate new scope
        List<Expr> curExprs = new ArrayList<>();
        List<Operand> curVals = new ArrayList<>();
        Map<Map<BasicBlock, Operand>, Operand> phiInsts = new HashMap<>();

        // process phi
        Instruction inst, nxtInst = null;
        for (inst = curBB.insthead; inst instanceof PhiInst; inst = nxtInst) {
            nxtInst = inst.next;
            PhiInst phiInst = (PhiInst) inst;
            // check meaningless
            Operand p = phiInst.from.values().iterator().next();
            boolean meaningless = true;
            for(var value : phiInst.from.values()){
                if(value != p){
                    meaningless = false;
                    break;
                }
            }
            if(meaningless || phiInsts.containsKey(phiInst.from)) { // meaningless or redundant
                valMap.put(phiInst.res, p);
                curVals.add(phiInst.res);
                inst.RMSelf();
                System.out.println("dvnt worked");
                changed = true;
            } else {
                phiInsts.put(phiInst.from, phiInst.res);
                valMap.put(phiInst.res, phiInst.res);
                curVals.add(phiInst.res);
            }
        }

        for (; inst != null; inst = nxtInst) {
            nxtInst = inst.next;
            // overwrite
            // rewrite use registers with value number
            var useRegs = inst.getUseRegs();
            if (useRegs != null) {
                for (var use : useRegs) {
                    if (use instanceof VirReg) {
                        var tmp = valMap.get(use);
                        if (tmp != use) {
                            System.out.println("dvnt worked");
                            inst.replaceUse(use, tmp);
                        }
                    }
                }
            }
            if (inst instanceof BinOpInst) {
                var binInst = (BinOpInst) inst;
                var expr = new Expr(binInst.op, binInst.lhs, binInst.rhs);
                var anotherOp = BinaryOperator.getCommutable(binInst.op);
                Expr expr2 = null;
                if (anotherOp != null)
                    expr2 = new Expr(anotherOp, binInst.rhs, binInst.lhs);
                var tmp = ExprMap.get(expr);
                if (tmp == null && expr2 != null)
                    tmp = ExprMap.get(expr2);

                if (tmp != null) {  // redundant
                    valMap.put(binInst.res, tmp);
                    curVals.add(binInst.res);
                    System.out.println("dvnt bin worked");
                    inst.RMSelf();
                    changed = true;
                } else {
                    valMap.put(binInst.res, binInst.res);
                    ExprMap.put(expr, binInst.res);
                    curVals.add(binInst.res);
                    curExprs.add(expr);

                    if(anotherOp != null){
                        var commutedExpr = new Expr(anotherOp, binInst.rhs, binInst.lhs);;
                        ExprMap.put(commutedExpr, binInst.res);
                        curExprs.add(commutedExpr);
                    }
                }
            } else if (inst instanceof UnaryOpInst) {
                var unaInst = (UnaryOpInst) inst;
                var expr = new Expr(unaInst.op, unaInst.src);
                var tmp = ExprMap.get(expr);
                if (tmp != null) {  // redundant
                    valMap.put(unaInst.res, tmp);
                    curVals.add(unaInst.res);
                    System.out.println("dvnt una worked");
                    inst.RMSelf();
                    changed = true;
                } else {
                    valMap.put(unaInst.res, unaInst.res);
                    ExprMap.put(expr, unaInst.res);
                    curVals.add(unaInst.res);
                    curExprs.add(expr);
                }
            } else if (inst instanceof MoveInst) {
                if (((MoveInst) inst).moveFrom instanceof VirReg) {
                    valMap.put(((MoveInst) inst).moveTo, ((MoveInst) inst).moveFrom);
                    curVals.add(((MoveInst) inst).moveTo);
                    inst.RMSelf();
                    System.out.println("dvnt move worked");
                    changed = true;
                } else {
                    valMap.put(inst.getDefReg(), inst.getDefReg());
                    curVals.add(inst.getDefReg());
                }
            }
            else if (inst.getDefReg() != null) {
                valMap.put(inst.getDefReg(), inst.getDefReg());
                curVals.add(inst.getDefReg());
            }
        }

        // modify phiInsts
        for(var succBB : curBB.succBBs){
            for(inst = succBB.insthead; inst instanceof PhiInst; inst = inst.next){
                var phiInst = (PhiInst) inst;
                for(var entry : phiInst.from.entrySet()){
                    var reg = entry.getValue();
                    if(!(reg instanceof VirReg)) continue;

                    var tmp = valMap.get(reg);
                    if(tmp != null && tmp != reg){
                        phiInst.from.put(entry.getKey(), tmp);
                    }
                }
            }
        }

        // recursive run on domTree children
        List<BasicBlock> children = new ArrayList<>(curBB.DomBBs);
//        children.sort(new Comparator<BasicBlock>() {
//            @Override
//            public int compare(BasicBlock basicBlock, BasicBlock t1) {
//                return t1.RPOnum - basicBlock.RPOnum;
//            }
//        });
        children.sort(new ReversePostOrderComparator());
        for(var child : children)
            run(child);

        // deallocate
        ExprMap.keySet().removeAll(curExprs);
        valMap.keySet().removeAll(curVals);
    }

    // private class
    private static class Expr {
        boolean isBin = false;
        BinaryOperator binOp = null;
        UnaryOperator unOp = null;
        Operand src1 = null;
        Operand src2 = null;
        Expr(BinaryOperator binOp, Operand src1, Operand src2) {
            isBin = true;
            this.binOp = binOp;
            this.src1 = src1;
            this.src2 = src2;
        }
        Expr(UnaryOperator unOp, Operand src) {
            isBin = false;
            this.unOp = unOp;
            this.src1 = src;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Expr expr = (Expr) o;
            return isBin == expr.isBin &&
                    binOp == expr.binOp &&
                    unOp == expr.unOp &&
                    Objects.equals(src1, expr.src1) &&
                    Objects.equals(src2, expr.src2);
        }

        @Override
        public int hashCode() {
            return Objects.hash(isBin, binOp, unOp, src1, src2);
        }
    }

    class ReversePostOrderComparator implements Comparator<BasicBlock>{

        @Override
        public int compare(BasicBlock o1, BasicBlock o2) {
            return o2.RPOnum - o1.RPOnum;
        }
    }
}
