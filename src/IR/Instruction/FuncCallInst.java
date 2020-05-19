package IR.Instruction;

import IR.BasicBlock;
import IR.Function;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import RISCV.RISCV_Info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FuncCallInst extends Instruction {
    public Function callTo;
    public ArrayList<Operand> params;
    public Operand thisPointer;
    public Operand res;

    // whether treat it as RiscV Call, which does not contain params
    public boolean isRiscV;


    public FuncCallInst(BasicBlock BB, Function callTo, ArrayList<Operand> params, Operand res) {
        super(BB);
        this.setCallTo(callTo);
        this.params = params;
        this.res = res;
    }

    public void addParam(Operand param) {
        params.add(param);
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public Function getCallTo() {
        return callTo;
    }

    public void setCallTo(Function callTo) {
        this.callTo = callTo;
    }


    @Override
    public Operand getDefReg() {
        return res;
    }

    @Override
    public List<Operand> getUseRegs() {
        List<Operand> res = new ArrayList<Operand>();
        if (thisPointer != null && (!(thisPointer instanceof ConstInt))) {
            res.add(thisPointer);
        }
        for (var para : params) {
            if (!(para instanceof ConstInt))
                res.add(para);
        }
        return res;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);

        if (thisPointer instanceof Variable)
            thisPointer = renameMap.get(thisPointer);
        for (int i = 0; i < params.size(); i++) {
            var para = params.get(i);
            if (para instanceof Variable)
                params.set(i, renameMap.get(para));
        }
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        var resOpr = (res != null) ? regRenameMap.get(res) : null;
        ArrayList<Operand> copyPara = new ArrayList<Operand>();
        for (var para : params)
            copyPara.add(regRenameMap.getOrDefault(para, para));
        FuncCallInst retInst = new FuncCallInst(BBRenameMap.get(curBB), callTo, copyPara, resOpr);
        if (thisPointer != null)
            retInst.thisPointer = regRenameMap.getOrDefault(thisPointer, thisPointer);
        return retInst;
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (thisPointer instanceof VirReg) {
            thisPointer = NewNameForUse(reg_infoMap, (VirReg) thisPointer);
            ((VirReg) thisPointer).usedInstructions.add(inInst);
        }
        for (int i = 0; i < params.size(); i++) {
            var old = params.get(i);
            if (old instanceof VirReg) {
                var newName = NewNameForUse(reg_infoMap, (VirReg) old);
                params.set(i, newName);
                ((VirReg) newName).usedInstructions.add(inInst);
            }
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (res instanceof VirReg) {
            res = NewNameForDef(reg_infoMap, (VirReg) res);
            assert ((VirReg) res).defInst == null;
            ((VirReg) res).defInst = this;
        }
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (thisPointer == virReg)
            thisPointer = constInt;
        for (int i = 0; i < params.size(); i++) {
            var old = params.get(i);
            if (old == virReg)
                params.set(i, constInt);
        }
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        if (thisPointer == virReg)
            thisPointer = constString;
        for (int i = 0; i < params.size(); i++) {
            var old = params.get(i);
            if (old == virReg)
                params.set(i, constString);
        }
    }

    @Override
    public void CalcDefUseSet() {
        Def.clear();
        Use.clear();
        for (int i = 0; i < Integer.min(8, params.size()); i++)
            Use.add(RISCV_Info.virtualPhyRegs.get("a" + i));
        Def.addAll(RISCV_Info.virtualCallerSavedRegs);
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {

    }

    @Override
    public void replaceUse(Operand use, Operand changeTo) {
        if (thisPointer == use)
            thisPointer = changeTo;
        for (int i = 0; i < params.size(); i++) {
            var old = params.get(i);
            if (old == use)
                params.set(i, changeTo);
        }
    }
}
