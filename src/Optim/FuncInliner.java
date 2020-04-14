package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.Operand;
import IR.Operand.Pointer;
import IR.Operand.VirReg;

import java.util.*;


// TODO: implement recursive inline

public class FuncInliner {
    final int MAXInst = 100;

    IRPrinter irPrinter;

    Module program;

    Map<Function, Integer> funcInstCntMap;
    Map<Function, Integer> funcCalledCntMap;
    Map<Function, func_call_info> functionfunc_call_infoMap;

    private class func_call_info {
        Set<Function> callTOSet = new HashSet<Function>();
        Set<Function> recursiveCallTOSet = new HashSet<Function>();
    }

    public FuncInliner(Module program) {
        this.program = program;
        funcInstCntMap = new HashMap<Function, Integer>();
        funcCalledCntMap = new HashMap<Function, Integer>();
        functionfunc_call_infoMap = new HashMap<Function, func_call_info>();
        irPrinter = new IRPrinter(System.out);
    }

    public void run() {
        InstsCnt();
        CalcRecursiveCallSet();
        TryNonRecursiveInline();

        TryRecursiveInline(); // TODO: seems codegen doesn't contain testcase that need this
    }

    private void TryNonRecursiveInline() {
        // non recursive calls
        boolean changed = true;
        while (changed) {
            changed = false;
            for (var func : program.getGlobalFuncMap().values()) {
                if (Function.isBuiltIn(func)) continue;
                var RPOBBs = func.getReversePostOrderBBs();
                var instCnt = funcInstCntMap.get(func);
                boolean thisChanged = false;
                for (var bb : RPOBBs) {
                    for (Instruction inst = bb.insthead, nxtInst; inst != null; inst = nxtInst) {
                        nxtInst = inst.next;
                        if (!(inst instanceof FuncCallInst)) continue;
                        var callTo = ((FuncCallInst) inst).getCallTo();
                        if (Function.isBuiltIn(callTo)) continue;
                        var calltoRecursiveCallTOSet = functionfunc_call_infoMap.get(callTo).recursiveCallTOSet; // call to won't recursive call
                        if (calltoRecursiveCallTOSet.contains(callTo)) continue;
                        if (instCnt + funcInstCntMap.get(callTo) < MAXInst) {
                            changed = true;
                            thisChanged = true;
                            nxtInst = doInline((FuncCallInst) inst);
                            funcCalledCntMap.replace(callTo, funcCalledCntMap.get(callTo) - 1);
                            funcInstCntMap.replace(func, instCnt + funcInstCntMap.get(callTo));
                        }
                    }
                }
                if (thisChanged) {
                    func.CalcReversePostOrderBBs();
                }
            }
            for (var func : funcCalledCntMap.entrySet()) {
                if (func.getValue() == 0 && !func.getKey().getFuncname().equals("__init"))
                    program.getGlobalFuncMap().remove(func.getKey().getFuncname());
            }
        }
    }

    private void TryRecursiveInline() {

    }

    private void InstsCnt() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            if (functionfunc_call_infoMap.get(func) == null)
                functionfunc_call_infoMap.put(func, new func_call_info());

            var RPOBBs = func.getReversePostOrderBBs();
            int instsCnt = 0;
            funcInstCntMap.put(func, instsCnt);
            for (var bb : RPOBBs) {
                for (var inst = bb.insthead; inst != null; inst = inst.next) {
                    ++instsCnt;
                    if (inst instanceof FuncCallInst) {
                        var toCall = ((FuncCallInst) inst).getCallTo();
                        if (funcCalledCntMap.containsKey(toCall))
                            funcCalledCntMap.put(toCall, funcCalledCntMap.get(toCall) + 1);
                        else
                            funcCalledCntMap.put(toCall, 1);
                    }
                }
            }
        }
    }

    private void CalcRecursiveCallSet(){
        // Calc CallTOSet
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            var funcCallTOSet = functionfunc_call_infoMap.get(func).callTOSet;
            funcCallTOSet.clear();
            func.getReversePostOrderBBs().forEach(basicBlock -> {
                for (var inst = basicBlock.insthead; inst != null; inst = inst.next) {
                    if (inst instanceof FuncCallInst) {
                        var toCall = ((FuncCallInst) inst).getCallTo();
                        if (Function.isBuiltIn(toCall)) continue;
                        funcCallTOSet.add(toCall);
                    }
                }
            });
        }


        // CalcRecursiveCallTOSet, based on fixed-point algorithm
        Set<Function> newRecursiveCallTOSet = new HashSet<Function>();
        boolean changed = true;
        while (changed) {
            changed = false;
            for (var func : functionfunc_call_infoMap.keySet()) {
                if (Function.isBuiltIn(func)) continue;
                var funcRecursiveCallTOSet = functionfunc_call_infoMap.get(func).recursiveCallTOSet;
                var funcCallTOSet = functionfunc_call_infoMap.get(func).callTOSet;
                newRecursiveCallTOSet.clear();
                newRecursiveCallTOSet.addAll(funcCallTOSet);
                for (var toCall : funcCallTOSet) {
                    if (Function.isBuiltIn(toCall)) continue;
                    newRecursiveCallTOSet.addAll(functionfunc_call_infoMap.get(toCall).recursiveCallTOSet);
                }
                if (! newRecursiveCallTOSet.equals(funcRecursiveCallTOSet)) {
                    funcRecursiveCallTOSet.clear();
                    funcRecursiveCallTOSet.addAll(newRecursiveCallTOSet);
                    changed = true;
                }
            }
        }
    }

    private Instruction doInline(FuncCallInst callInst) {
        BasicBlock oldBB = callInst.curBB;
        oldBB.ended = false;
        Function curFunc = oldBB.getFunc();
        Function CallTo = callInst.getCallTo();

        // split
        BasicBlock afterCallBB = new BasicBlock(curFunc, "afterCallBB");
        if (curFunc.exitBB == oldBB)
            curFunc.exitBB = afterCallBB;

        for (var oldSucc : oldBB.getSuccBBs()) {
            oldSucc.predBBs.remove(oldBB);
            oldSucc.predBBs.add(afterCallBB);
            afterCallBB.succBBs.add(oldSucc);
        }
        oldBB.succBBs.clear();

        List<Instruction> tmpInstList = new ArrayList<Instruction>();
        for (Instruction inst = oldBB.insttail, lastInst; inst != callInst; inst = lastInst) {
            lastInst = inst.prev;
            oldBB.removeTail();
            tmpInstList.add(inst);
        }

        for (int i = tmpInstList.size() - 1; i >= 0; --i) {
            var inst = tmpInstList.get(i);
            inst.curBB = afterCallBB;
            if (inst.isBranchInst())
                afterCallBB.endBB(inst);
            else
                afterCallBB.addInst(inst);
        }
        afterCallBB.insthead.prev = null;
        var afterCallFirst = afterCallBB.insthead;

        // copy callTo between curBB && afterCallBB
        Map<Operand, Operand> regRenameMap = new HashMap<Operand, Operand>();
        Map<BasicBlock, BasicBlock> BBRenameMap = new HashMap<BasicBlock, BasicBlock>();
        program.getGlobalVar().values().forEach(globalVal-> regRenameMap.put(globalVal, globalVal));
        program.getStringPool().values().forEach(globalStr -> regRenameMap.put(globalStr, globalStr));
        if (callInst.thisPointer != null) {
            VirReg newParaReg = new VirReg("_this");
            callInst.linkPrev(new MoveInst(oldBB, newParaReg, callInst.thisPointer));
            regRenameMap.put(CallTo.thisPointer, newParaReg);
        }

//        CommonFunc.printlnAnything(callInst.params.size());
        for (int i = 0; i < callInst.params.size(); i++) {
            var para = callInst.params.get(i);
            var oldNameThere = CallTo.args.get(i);
            VirReg newParaReg = new VirReg("_" + oldNameThere.getName());
            callInst.linkPrev(new MoveInst(oldBB, newParaReg, para));
            regRenameMap.put(oldNameThere, newParaReg);
        }
        callInst.RMSelf();
        BBRenameMap.put(CallTo.entryBB, oldBB);
        BBRenameMap.put(CallTo.exitBB, afterCallBB);
        for (var toCopyBB : CallTo.getReversePostOrderBBs()) {
            if (!BBRenameMap.containsKey(toCopyBB))
                BBRenameMap.put(toCopyBB, new BasicBlock(curFunc, "_" + toCopyBB.getName()));
        }

        for (var toCopyBB : CallTo.getReversePostOrderBBs()) {
            var CopyBB = BBRenameMap.get(toCopyBB);
            for (var inst = toCopyBB.insthead; inst != null; inst = inst.next) {
                var defReg = inst.getDefReg();
                var useRegs = inst.getUseRegs();
                if (defReg != null) {
                    if (!regRenameMap.containsKey(defReg)) {
                        if (defReg instanceof Pointer) {
                            Pointer tmp = (Pointer) defReg.CopySelf();
                            tmp.pointTO = (VirReg) regRenameMap.get(tmp.pointTO);
                            regRenameMap.put(defReg, tmp);
                        }
                        else
                            regRenameMap.put(defReg, defReg.CopySelf());
                    }
                }
                if (useRegs != null) {
                    for (var reg : useRegs) {
                        if (!regRenameMap.containsKey(reg)) {
                            if (reg instanceof Pointer) {
                                Pointer tmp = (Pointer) reg.CopySelf();
                                tmp.pointTO = (VirReg) regRenameMap.get(tmp.pointTO);
                                regRenameMap.put(reg, tmp);
                            }
                            else
                                regRenameMap.put(reg, reg.CopySelf());
                        }
                    }
                }
                Instruction newInst = inst.CopySelfWithNewName(regRenameMap, BBRenameMap);
                if (toCopyBB != CallTo.exitBB) {
                    if (newInst.isBranchInst())
                        CopyBB.endBB(newInst);
                    else
                        CopyBB.addInst(newInst);
                } else {
                    if (newInst.isBranchInst()) {
                        assert newInst instanceof RetInst;
                        // call code need return value
                        if (! CallTo.isVoid) {
                            var newMove = new MoveInst(CopyBB, callInst.res, ((RetInst) newInst).retVal);
                            afterCallFirst.linkPrev(newMove);
                        }
//                        CopyBB.endBB(newInst);
                    } else
                        afterCallFirst.linkPrev(newInst);
                }
            }
        }
        if (! oldBB.getEnded()) {
            oldBB.endBB(new JumpInst(oldBB, afterCallBB));
        }
        return afterCallFirst;
    }

}
