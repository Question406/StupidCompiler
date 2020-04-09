package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.Instruction.Instruction;
import IR.Module;
import IR.Operand.VirReg;

import java.util.*;

// SCCP described in Advanced Compiler Design

public class SCCP extends Optimizer {
    private class SCCPVirReg {
        VirReg virReg;
        Set<Instruction> usedInsts = new HashSet<Instruction>();

    }
    private enum LatState {
        undef, explicitdef, multidef
    }

    public SCCP(Module program) {
        super(program);
    }

    Queue<BasicBlock> BlockWorkList = new LinkedList<BasicBlock>();
    Queue<VirReg> VirRegWorkList = new LinkedList<VirReg>();
    Map<VirReg, LatState> VirRegStateMap = new HashMap<VirReg, LatState>();

    @Override
    public boolean run() {
        boolean res = false;
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            res |= run(func);
        }
        return res;
    }

    private boolean run(Function func) {
        boolean res = false;
        Initialize(func);

        return false;
    }

    private void Initialize(Function func) {
        // clear maps
        BlockWorkList.clear();
        VirRegWorkList.clear();
        VirRegStateMap.clear();

        // block work list initialize
        BlockWorkList.add(func.entryBB);
        BlockWorkList.addAll(func.entryBB.succBBs);
    }


}
