package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.Module;

import java.util.*;

public class LoopAnalysis extends Optimizer {
    Set<BasicBlock> Headers;
    protected Map<BasicBlock, Set<BasicBlock>> Backers = new HashMap<>();
    protected Map<BasicBlock, Set<BasicBlock>> belongingLoopHeaders = new HashMap<>();
    protected Map<BasicBlock, Set<BasicBlock>> loopGroups = new HashMap<>();
    protected Map<BasicBlock, Set<BasicBlock>> loopExits = new HashMap<>();

    public LoopAnalysis(Module program) {
        super(program);
    }

    @Override
    public boolean run() {
        Headers = new HashSet<BasicBlock>();
        program.getGlobalFuncMap().forEach((s, func)->{
            if (!Function.isBuiltIn(func))
                run(func);
        });
        return false;
    }

    private void run(Function function) {
        for (var bb : function.getReversePostOrderBBs()) {
            for (var succ : bb.succBBs) {
                if (succ.DomBBs.contains(bb)) { // a back edge
                    Headers.add(succ);
                    Backers.computeIfAbsent(succ, k -> new HashSet<>());
                    Backers.get(succ).add(bb);
                }
            }
        }

        //compute loop groups
        Stack<BasicBlock> workList = new Stack<>();
        for (BasicBlock loopHeader : Headers) {
            workList.clear();
            loopGroups.put(loopHeader, new HashSet<>());
            loopGroups.get(loopHeader).add(loopHeader);
            for (BasicBlock backer : Backers.get(loopHeader)) {
                workList.add(backer);
                loopGroups.get(loopHeader).add(backer);
                for (; !workList.isEmpty(); ) {
                    BasicBlock nowBlock = workList.pop();
                    for (BasicBlock predecessor : nowBlock.predBBs)
                        if (!loopGroups.get(loopHeader).contains(predecessor)) {
                            loopGroups.get(loopHeader).add(predecessor);
                            workList.add(predecessor);
                            belongingLoopHeaders.computeIfAbsent(predecessor, k -> new HashSet<>());
                            belongingLoopHeaders.get(predecessor).add(loopHeader);
                        }
                }
            }
        }
        //compute loop exits
        for (BasicBlock loopHeader : Headers) {
            loopExits.put(loopHeader, new HashSet<>());
            for (BasicBlock loopMember : loopGroups.get(loopHeader))
                for (BasicBlock successor : loopMember.succBBs)
                    if (!loopGroups.get(loopHeader).contains(successor)) {
                        loopExits.get(loopHeader).add(loopMember);
                    }
        }
    }

    public int loopLevel(BasicBlock bb) {
        return belongingLoopHeaders.get(bb) == null ? 0 : belongingLoopHeaders.get(bb).size();
    }
}
