package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import RISCV.RISCV_Info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AllocaInst extends Instruction {
    public Operand reg;
    public Operand allocSize;

    public AllocaInst(BasicBlock BB, Operand reg, Operand object) {
        super(BB);
        this.reg = reg;
        this.allocSize = object;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public Operand getReg() {
        return reg;
    }

    public Operand getAllocSize() {
        return allocSize;
    }


    @Override
    public Operand getDefReg() {
        return reg;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> res = new ArrayList<Operand>();
        if (! (allocSize instanceof ConstInt))
            res.add(allocSize);
        return res;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (reg instanceof Variable)
            reg = renameMap.get(reg);
        if (allocSize instanceof Variable)
            allocSize = renameMap.get(allocSize);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new AllocaInst(BBRenameMap.get(curBB), regRenameMap.getOrDefault(reg, reg), regRenameMap.getOrDefault(allocSize, allocSize));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (allocSize instanceof VirReg) {
            allocSize = NewNameForUse(reg_infoMap, (VirReg) allocSize);
            ((VirReg) allocSize).usedInstructions.add(inInst);
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (reg instanceof VirReg) {
            reg = NewNameForDef(reg_infoMap, (VirReg) reg);
            assert ((VirReg) reg).defInst == null;
            ((VirReg) reg).defInst = this;
        }
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (allocSize == virReg)
            allocSize = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        assert false;
    }

    @Override
    public void CalcDefUseSet() {
        Def.clear();
        Use.clear();
        Use.add(RISCV_Info.virtualPhyRegs.get("a0")); // only one alloc size used
        Def.addAll(RISCV_Info.virtualCallerSavedRegs);
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {

    }

    @Override
    public void replaceUse(Operand use, Operand changeTo) {
        if (allocSize == use)
            allocSize = changeTo;
    }


}
