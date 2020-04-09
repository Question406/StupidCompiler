package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Optim.SSAConstructor;
import Utils.UnaryOperator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UnaryOpInst extends Instruction{
    public UnaryOperator op;
    public Operand res;
    public Operand src;

    public UnaryOpInst(BasicBlock BB, Operand res, UnaryOperator op, Operand src) {
        super(BB);
        this.res = res;
        this.op = op;
        this.src = src;
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
        ArrayList<Operand> res = new ArrayList<Operand>();
        if (!(src instanceof ConstInt))
            res.add(src);
        return res;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);
        if (src instanceof Variable)
            src = renameMap.get(src);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new UnaryOpInst(BBRenameMap.get(curBB), regRenameMap.get(res), op, regRenameMap.getOrDefault(src, src));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (src instanceof VirReg)
            src = NewNameForUse(reg_infoMap, (VirReg) src);
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (res instanceof VirReg)
            res = NewNameForDef(reg_infoMap, (VirReg) res);
    }
}
