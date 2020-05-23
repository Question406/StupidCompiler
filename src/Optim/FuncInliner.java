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
    final int MAXINLINE_CNT = 3;

    IRPrinter irPrinter;

    Module program;

    Map<Function, Integer> funcInstCntMap;
    Map<Function, Integer> funcCalledCntMap;
    Map<Function, func_call_info> functionfunc_call_infoMap;

    Map<String, Function> originFunc;

    public class func_call_info {
        Set<Function> callTOSet = new HashSet<Function>();
        Set<Function> recursiveCallTOSet = new HashSet<Function>();
    }

    public FuncInliner(Module program) {
        this.program = program;
        funcInstCntMap = new HashMap<Function, Integer>();
        funcCalledCntMap = new HashMap<Function, Integer>();
        functionfunc_call_infoMap = new HashMap<Function, func_call_info>();
        originFunc = new HashMap<String, Function>();
        irPrinter = new IRPrinter(System.out);
    }

    public void run() {
        InstsCnt();
        DeadFuncElem();
        CalcRecursiveCallSet();
        TryNonRecursiveInline();
        functionfunc_call_infoMap.clear();
        InstsCnt();
        DeadFuncElem();
        TryRecursiveInline(); // TODO: seems codegen doesn't contain testcase that need this
        functionfunc_call_infoMap.clear();
        InstsCnt();
        DeadFuncElem();
        CalcRecursiveCallSet();

        funcInstCntMap.clear();
        funcCalledCntMap.clear();
        originFunc.clear();
    }

    private void DeadFuncElem() {
        ArrayList<Function> toRM = new ArrayList<>();
        for (var func : program.getGlobalFuncMap().values()) {
            if (!funcCalledCntMap.containsKey(func) && !func.getFuncname().equals("__init") && !Function.isBuiltIn(func))
                toRM.add(func);
        }
        program.getGlobalFuncMap().values().removeAll(toRM);
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

    private void makeFuncCopy() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;;
            Function copyFunc = new Function("copy_" + func.getFuncname());
            copyFunc.isVoid = func.isVoid;
            originFunc.put(func.funcname, copyFunc);

            Map<Operand, Operand> argMap = new HashMap<>();
            program.getGlobalVar().values().forEach(globalVal-> argMap.put(globalVal, globalVal));
            program.getStringPool().values().forEach(globalStr -> argMap.put(globalStr, globalStr));
            if (func.thisPointer != null) {
                copyFunc.thisPointer = new VirReg(func.thisPointer.name);
                argMap.put(func.thisPointer, copyFunc.thisPointer);
            }

            for (var para : func.args) {
                VirReg newpara = new VirReg(para.name);
                copyFunc.args.add(newpara);
                argMap.put(para, newpara);
            }

            Map<BasicBlock, BasicBlock> bbmap = new HashMap<>();
            for (var bb : func.getReversePostOrderBBs()) {
                BasicBlock copyBB = new BasicBlock(copyFunc, "copy_" + bb.name);
                bbmap.put(bb, copyBB);
            }
            copyFunc.entryBB = bbmap.get(func.entryBB);
            copyFunc.exitBB = bbmap.get(func.exitBB);
            for (var bb : func.getReversePostOrderBBs()) {
                var correspondingBB = bbmap.get(bb);
                for (var predBB : bb.predBBs) {
                    correspondingBB.predBBs.add(bbmap.get(predBB));
                }
                for (var succBB : bb.succBBs) {
                    correspondingBB.succBBs.add(bbmap.get(succBB));
                }
                for (var inst = bb.insthead; inst != null; inst = inst.next) {
                    var defReg = inst.getDefReg();
                    var useRegs = inst.getUseRegs();
                    if (defReg != null) {
                        if (!argMap.containsKey(defReg)) {
                            if (defReg instanceof Pointer) {
                                Pointer tmp = (Pointer) defReg.CopySelf();
                                tmp.pointTO = (VirReg) argMap.get(tmp.pointTO);
                                argMap.put(defReg, tmp);
                            }
                            else
                                argMap.put(defReg, defReg.CopySelf());
                        }
                    }
                    if (useRegs != null) {
                        for (var reg : useRegs) {
                            if (!argMap.containsKey(reg)) {
                                if (reg instanceof Pointer) {
                                    Pointer tmp = (Pointer) reg.CopySelf();
                                    tmp.pointTO = (VirReg) argMap.get(tmp.pointTO);
                                    argMap.put(reg, tmp);
                                }
                                else
                                    argMap.put(reg, reg.CopySelf());
                            }
                        }
                    }
                    correspondingBB.addInst(inst.CopySelfWithNewName(argMap, bbmap));
                }
                bb.ended = true;
            }
            copyFunc.CalcReversePostOrderBBs();
//            irPrinter.visit(copyFunc);
        }
    }

    private void TryRecursiveInline() {
        makeFuncCopy();
        boolean changed = true;
        int inlineCnt = 0;
        while (changed && inlineCnt <= MAXINLINE_CNT) {
            changed = false;
            ++inlineCnt;
            for (var func : program.getGlobalFuncMap().values()) {
                if (Function.isBuiltIn(func) || func.funcname.equals("__init")) continue;
                var RPOBBs = func.getReversePostOrderBBs();
                var instCnt = funcInstCntMap.get(func);
                boolean thisChanged = false;
                for (var bb : RPOBBs) {
                    for (Instruction inst = bb.insthead, nxtInst; inst != null; inst = nxtInst) {
                        nxtInst = inst.next;
                        if (!(inst instanceof FuncCallInst)) continue;
                        var callTo = ((FuncCallInst) inst).getCallTo();
                        if (Function.isBuiltIn(callTo)) continue;
                        if (instCnt + funcInstCntMap.get(callTo) < MAXInst) {
                            changed = true;
                            thisChanged = true;
                            ((FuncCallInst) inst).callTo = originFunc.get(((FuncCallInst) inst).callTo.funcname);
                            nxtInst = doInline((FuncCallInst) inst);
                            funcInstCntMap.replace(func, instCnt + funcInstCntMap.get(callTo));
                        }
                    }
                }
                if (thisChanged) {
                    func.CalcReversePostOrderBBs();
                }
            }
        }
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
                            else {
                                regRenameMap.put(reg, reg.CopySelf());
                            }
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
