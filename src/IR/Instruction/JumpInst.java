package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.ConstInt;
import IR.Operand.ConstString;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.List;
import java.util.Map;

public class JumpInst extends Instruction {
    public BasicBlock jumpTo;

    public JumpInst(BasicBlock BB, BasicBlock jumpTo) {
        super(BB);
        this.jumpTo = jumpTo;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return null;
    }

    @Override
    public List<Operand> getUseRegs() {
        return null;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        return;
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new JumpInst(BBRenameMap.get(curBB), BBRenameMap.get(jumpTo));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        assert false;
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        assert false;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {

    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        assert false;
    }

    @Override
    public void CalcDefUseSet() {

    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {

    }


    public BasicBlock getJumpTo() {
        return jumpTo;
    }
}
