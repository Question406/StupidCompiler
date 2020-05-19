package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import RISCV.RISCV_Info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RetInst extends Instruction {
    public Operand retVal;

    public RetInst(BasicBlock BB, Operand retVal) {
        super(BB);
        this.retVal = retVal;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return null;
    }

    public Operand getRetVal() {
        return retVal;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> res = new ArrayList<Operand>();
        if (! (retVal instanceof ConstInt) && retVal != null)
            res.add(retVal);
        return res;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (retVal instanceof Variable || retVal instanceof ConstString)
            retVal = renameMap.get(retVal);
    }


    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new RetInst(BBRenameMap.get(curBB), regRenameMap.getOrDefault(retVal, retVal));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (retVal instanceof VirReg) {
            retVal = NewNameForUse(reg_infoMap, (VirReg) retVal);
            ((VirReg) retVal).usedInstructions.add(inInst);
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (retVal == virReg)
            retVal = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        if (retVal == virReg)
            retVal = constString;
    }

    @Override
    public void CalcDefUseSet() {
        Use.clear();
        Def.clear();
        Use.add(RISCV_Info.virtualPhyRegs.get("ra"));
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {

    }
}
