package Optim;

import AST.INTEGERNode;
import IR.BasicBlock;
import IR.Function;
import IR.Module;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class FuncInliner {
    Module program;

    Map<Function, FuncInfo> funcInfoMap;

    private class FuncInfo {
        int instsCnt;
        boolean callSelf;
    }

    public FuncInliner(Module program) {
        this.program = program;
        funcInfoMap = new HashMap<Function, FuncInfo>();
    }

    public void run() {
        InstsCnt();
    }

    private void InstsCnt() {

        for (var func : program.getGlobalFuncMap().values()) {
            var RPOBBs = func.getReversePostOrderBBs();
            for (var bb : RPOBBs) {
                int instsCnt = 0;
                for (var inst = bb.insthead; inst != null; inst = inst.next) {
                    ++instsCnt;
                }
            }
        }
    }

}
