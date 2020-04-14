package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.Module;

import java.util.HashSet;
import java.util.Set;

// highlight:   used to compute Dominance Tree && Reverse Dominance Tree

public class DominaceTreeBuilder extends Optimizer {
    public DominaceTreeBuilder(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        for (var function : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(function)) continue;
            ComputeIDomBB(function);
            ComputeDomFrontier(function);

            ComputePostIDomBB(function);
            ComputePostDomFros(function);
        }
        return false;
    }

    // highlight:   below is tool functions for BB Dominance compute
    // highlight:   DominanceTree build, brute-force one
    private void ComputeDomBB(Function function) {
        var RPOBBs = function.getReversePostOrderBBs();
        var RPOBBS_NoEntry = RPOBBs.subList(1, RPOBBs.size());
        int n = RPOBBs.size() - 1;
        function.entryBB.DomBBs = new HashSet<BasicBlock>();
        function.entryBB.DomBBs.add(function.entryBB);
        for (var bb : RPOBBS_NoEntry) {
            bb.DomBBs = new HashSet<BasicBlock>();
            bb.DomBBs.addAll(RPOBBs);
        }

        boolean changed = true;
        while (changed) {
            changed = false;
            for (var bb : RPOBBS_NoEntry) {
                var temp = new HashSet<BasicBlock>();
                boolean flag = true;
                for (var predBB : bb.predBBs)
                    if (predBB.DomBBs != null) {
                        if (flag) {
                            temp.addAll(predBB.DomBBs);
                            flag = false;
                        }
                        else
                            temp.retainAll(predBB.DomBBs);
                    }
                temp.add(bb);
                if (!setEqual(temp, bb.DomBBs)) {
                    changed = true;
                    bb.DomBBs = temp;
                }
            }
        }
    }
    private boolean setEqual(Set<BasicBlock> s1, Set<BasicBlock> s2) {
        if (s1.size() != s2.size())
            return false;
        else
            return s1.containsAll(s2);
    }

    // highlight:   Compute Dominance Tree, From <Engineering a Compiler>, Keith D.Cooper
    //              Must use ReversePostOrder BBs
    private void ComputeIDomBB(Function function) {
        var RPOBBs = function.getReversePostOrderBBs();
        RPOBBs.forEach(bb -> bb.IDom = null);
        function.entryBB.IDom = function.entryBB;
        boolean changed = true;
        while (changed) {
            changed = false;
            for (var bb : RPOBBs) {
                if (bb == function.entryBB) continue;
                BasicBlock newIDom = null;
                for (var predBB : bb.predBBs)
                    if (predBB.IDom != null) {
                        newIDom = predBB;
                        break;
                    }
                for (var predBB : bb.predBBs)
                    if (predBB != newIDom && predBB.IDom != null)
                        newIDom = intersect(newIDom, predBB);
                if (bb.IDom != newIDom) {
                    bb.IDom = newIDom;
                    changed = true;
                }
            }
        }

        // this is building DomBBs
        RPOBBs.forEach(bb -> bb.DomBBs = new HashSet<BasicBlock>());
        for (var bb : RPOBBs) {
            if (bb == function.entryBB) continue;
            bb.IDom.DomBBs.add(bb);
        }
    }

    private BasicBlock intersect(BasicBlock b1, BasicBlock b2) {
        BasicBlock finger1 = b1;
        BasicBlock finger2 = b2;
        while (finger1 != finger2) {
            while (finger1.RPOnum < finger2.RPOnum)
                finger1 = finger1.IDom;
            while (finger1.RPOnum > finger2.RPOnum)
                finger2 = finger2.IDom;
        }
        return finger1;
    }

    // highlight:   Compute Dominance Frontier
    private void ComputeDomFrontier(Function function) {
        var RPOBBs = function.getReversePostOrderBBs();
        RPOBBs.forEach(bb -> bb.DomFros = new HashSet<BasicBlock>());
        for (var bb : RPOBBs)
            if (bb.predBBs.size() >= 2) {
                for (var predbb : bb.predBBs) {
                    var runner = predbb;
                    while (runner != bb.IDom) {
                        runner.DomFros.add(bb);
                        runner = runner.IDom;
                    }
                }
            }
    }


    // highlight:   Compute Post-Dominance Tree
    private void ComputePostIDomBB(Function function) {
//        function.CalcReverseCFGPostOrderBBs();
//        List<BasicBlock> RPOBBs = new LinkedList<BasicBlock>(function.getReversePostOrderBBs());
//        Collections.reverse(RPOBBs);
        var RPOBBs = function.getReverseCFGPostOrderBBs();
        RPOBBs.forEach(bb -> bb.PostIDom = null);
        function.exitBB.PostIDom = function.exitBB;
        boolean changed = true;
        while (changed) {
            changed = false;
            for (var bb : RPOBBs) {
                if (bb == function.exitBB) continue;
                BasicBlock newPostIDom = null;
                for (var succbb : bb.succBBs)
                    if (succbb.PostIDom != null) {
                        newPostIDom = succbb;
                        break;
                    }
                for (var succBB : bb.succBBs)
                    if (succBB != newPostIDom && succBB.PostIDom != null)
                        newPostIDom = intersectPost(newPostIDom, succBB);
                if (bb.PostIDom != newPostIDom) {
                    bb.PostIDom = newPostIDom;
                    changed = true;
                }
            }
        }

        // this is building DomBBs
        RPOBBs.forEach(bb -> bb.PostDomBBs = new HashSet<BasicBlock>());
        for (var bb : RPOBBs) {
            if (bb == function.exitBB) continue;
            bb.PostIDom.PostDomBBs.add(bb);
        }
    }

    private void ComputePostDomFros(Function function) {
        var RPOBBs = function.getReversePostOrderBBs();
        RPOBBs.forEach(bb -> bb.PostDomFros = new HashSet<BasicBlock>());
        for (var bb : RPOBBs)
            if (bb.succBBs.size() >= 2) {
                for (var succbb : bb.succBBs) {
                    var runner = succbb;
                    while (runner != bb.PostIDom) {
                        runner.PostDomFros.add(bb);
                        runner = runner.PostIDom;
                    }
                }
            }
    }

    private BasicBlock intersectPost(BasicBlock b1, BasicBlock b2) {
        BasicBlock finger1 = b1;
        BasicBlock finger2 = b2;
        while (finger1 != finger2) {
            while (finger1.ReverseRPOnum < finger2.ReverseRPOnum)
                finger1 = finger1.PostIDom;
            while (finger1.ReverseRPOnum > finger2.ReverseRPOnum)
                finger2 = finger2.PostIDom;
        }
        return finger1;
    }

}
