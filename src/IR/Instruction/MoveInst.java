package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MoveInst extends Instruction {
    public Operand moveTo;
    public Operand moveFrom;

    public MoveInst(BasicBlock BB, Operand moveTo, Operand res) {
        super(BB);
        this.moveTo = moveTo;
        this.moveFrom = res;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return moveTo;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> res = new ArrayList<Operand>();
        if (! (moveFrom instanceof ConstInt))
            res.add(moveFrom);
        return res;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        if (moveTo instanceof Variable)
            moveTo = renameMap.get(moveTo);
        if (moveFrom instanceof Variable)
            moveFrom = renameMap.get(moveFrom);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new MoveInst(BBRenameMap.get(curBB), regRenameMap.get(moveTo), regRenameMap.getOrDefault(moveFrom, moveFrom));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (moveFrom instanceof VirReg) {
            moveFrom = NewNameForUse(reg_infoMap, (VirReg) moveFrom);
            ((VirReg) moveFrom).usedInstructions.add(inInst);
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (moveTo instanceof VirReg) {
            moveTo = NewNameForDef(reg_infoMap, (VirReg) moveTo);
            assert ((VirReg) moveTo).defInst == null;
            ((VirReg) moveTo).defInst = this;
        }
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (moveFrom == virReg)
            moveFrom = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        if (moveFrom == virReg)
            moveFrom = constString;
    }
}
