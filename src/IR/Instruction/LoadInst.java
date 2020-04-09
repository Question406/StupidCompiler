package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LoadInst extends Instruction {
    public Operand from;
    public Operand res;

    public LoadInst(BasicBlock BB, Operand res, Operand from) {
        super(BB);
        this.res = res;
        this.from = from;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return res;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> res = new ArrayList<Operand>();
        res.add(from);
        return res;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);
        if (from instanceof Variable)
            from = renameMap.get(from);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new LoadInst(BBRenameMap.get(curBB), regRenameMap.get(res), regRenameMap.getOrDefault(from, from));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (from instanceof VirReg)
            from = NewNameForUse(reg_infoMap, (VirReg) from);
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (res instanceof VirReg)
            res = NewNameForDef(reg_infoMap, (VirReg) res);
    }
}
