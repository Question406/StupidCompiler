package Optim;

import IR.BasicBlock;
import IR.Function;
import IR.IRPrinter;
import IR.Instruction.Instruction;
import IR.Instruction.PhiInst;
import IR.Module;
import IR.Operand.Operand;
import IR.Operand.VirReg;

import java.util.*;

// SSA constructor in Engineering a Compiler
// highlight:   during the visit of InsertPhiInsts, clear all regs used instruction set && add insts to it in rename phase

public class SSAConstructor {
    Module program;
    IRPrinter irPrinter;

    public class ssa_reg_info {
        public int name_counter = 0;
        public Set<BasicBlock> blockSet = new HashSet<BasicBlock>();
        public Stack<Integer> name_Stack = new Stack<Integer>();
    }

    Map<VirReg, ssa_reg_info> reg_infoMap = new HashMap<VirReg, ssa_reg_info>();
    HashSet<VirReg> cur_globals;

    public SSAConstructor(Module program) {
        this.program = program;
        irPrinter = new IRPrinter(System.out);
    }

    public void run() {
        for (var func : program.getGlobalFuncMap().entrySet()) {
            var function = func.getValue();
            if (Function.isBuiltIn(function)) continue;
            // insert phi insts
            InsertPhiInsts(function);
            // variable rename
            RenameVars(function);
//            irPrinter.visit(function);
        }
    }

    private void InsertPhiInsts(Function function) {
        if (cur_globals == null) cur_globals = new HashSet<VirReg>();
        cur_globals.clear();
        var RPOBBs = function.getReversePostOrderBBs();
        HashSet<Operand> varKill = new HashSet<>();
        for (var bb : RPOBBs) {
            varKill.clear();
            for (var inst = bb.insthead; inst != null; inst = inst.next) {
                if (inst instanceof PhiInst) continue;
                var useRegs = inst.getUseRegs();
                var defReg = inst.getDefReg();
                if (useRegs != null) {
                    for (var useReg : useRegs) {
                        if (useReg instanceof VirReg) {
                            if (!varKill.contains(useReg))
                                cur_globals.add((VirReg) useReg);
                            if (!reg_infoMap.containsKey(useReg)) {
                                reg_infoMap.put((VirReg) useReg, new ssa_reg_info());
                            }
                        }
                    }
                }
                if (defReg instanceof VirReg) {
                    ((VirReg) defReg).usedInstructions.clear();
                    ((VirReg) defReg).defInst = null;
                    varKill.add(defReg);
                    var reg_info = reg_infoMap.get((VirReg) defReg);
                    if (reg_info == null) {
                        reg_info = new ssa_reg_info();
                        reg_infoMap.put((VirReg) defReg, reg_info);
                    }
                    reg_info.blockSet.add(bb);
                }
            }
        }

        Queue<BasicBlock> workList = new LinkedList<BasicBlock>();
        Set<BasicBlock> has_put_phi = new HashSet<BasicBlock>();
        for (var reg_x : cur_globals) {
            workList.clear();
            has_put_phi.clear();
            workList.addAll(reg_infoMap.get(reg_x).blockSet);
            while (!workList.isEmpty()){
                var bb = workList.remove();
                for (var DFbb : bb.DomFros) {
                    if (! has_put_phi.contains(DFbb)) {
                        has_put_phi.add(DFbb);
                        DFbb.insthead.linkPrev(new PhiInst(DFbb, reg_x));
                        workList.add(DFbb);
                    }
                }
            }
        }
    }

    private void RenameVars(Function function) {
        // args also names in a function
        if (function.thisPointer != null && reg_infoMap.containsKey(function.thisPointer)) {
            function.thisPointer = NewName(function.thisPointer);
        }
        for (int i = 0; i < function.args.size(); i++) {
            var oldarg = function.args.get(i);
            if (!reg_infoMap.containsKey(oldarg))
                continue;
            function.args.set(i, NewName(oldarg));
        }
        recursiveRenameVars(function.entryBB);

        if (function.thisPointer != null && reg_infoMap.containsKey(function.thisPointer))
            reg_infoMap.get(function.thisPointer.getOldName()).name_Stack.pop();
        function.args.forEach(arg -> {
            if (reg_infoMap.get(arg) != null)
                reg_infoMap.get(arg).name_Stack.pop();
        });
    }

    private VirReg NewName(VirReg toDO) {
        var i = reg_infoMap.get(toDO).name_counter;
        reg_infoMap.get(toDO).name_counter++;
        reg_infoMap.get(toDO).name_Stack.push(i);
        return toDO.getSSANewName(i);
    }

    private void recursiveRenameVars(BasicBlock curBB) {
        Instruction inst;
        for (inst = curBB.insthead; inst != null; inst = inst.next) {
            if (! (inst instanceof PhiInst)) break;
            VirReg res = (VirReg) ((PhiInst) inst).res;
            ((PhiInst) inst).res = NewName(res);
            assert ((VirReg) ((PhiInst) inst).res).defInst == null;
            ((VirReg) ((PhiInst) inst).res).defInst = inst;
        }

        for (; inst != null; inst = inst.next) {
            inst.renameSSAForUse(reg_infoMap, inst);
            inst.renameSSAForDef(reg_infoMap);
        }

        for (var succBB : curBB.succBBs) {
            for (var instInSucc = succBB.insthead; instInSucc != null; instInSucc = instInSucc.next) {
                if (! (instInSucc instanceof PhiInst)) break;
                PhiInst phiInst = (PhiInst) instInSucc;
                VirReg oldName = (((VirReg) phiInst.res).getOldName() == null) ? (VirReg) phiInst.res :  ((VirReg) phiInst.res).getOldName();
                var stack = reg_infoMap.get(oldName).name_Stack;
                VirReg newName = (! stack.empty()) ? oldName.getSSANewName(stack.peek()) : null;
                ((PhiInst) instInSucc).from.put(curBB, newName);

                if (newName != null)
                    newName.usedInstructions.add(instInSucc);
            }
        }

        curBB.DomBBs.forEach(this::recursiveRenameVars);

        for (inst = curBB.insthead; inst != null; inst = inst.next) {
            var res = inst.getDefReg();
            if (res instanceof VirReg)
                reg_infoMap.get(((VirReg) res).getOldName()).name_Stack.pop();
        }
    }

}
