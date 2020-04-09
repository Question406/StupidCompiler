package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import IR.Operand.Variable;
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
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        return;
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new JumpInst(BBRenameMap.get(curBB), BBRenameMap.get(jumpTo));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }


    public BasicBlock getJumpTo() {
        return jumpTo;
    }
}
