package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PhiInst extends Instruction {
    public Operand res;
    public Map<BasicBlock, Operand> from;

    public PhiInst(BasicBlock BB, Operand res) {
        super(BB);
        this.res = res;
        from = new HashMap<BasicBlock, Operand>();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return res;
    }

    @Override
    public List<Operand> getUseRegs() {
        return null;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {

    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return null;
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }


}
