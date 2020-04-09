package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Optim.SSAConstructor;
import Utils.BinaryOperator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CmpInst extends Instruction {
    public BinaryOperator op;
    public Operand res;
    public Operand lhs;
    public Operand rhs;

    public CmpInst(BasicBlock BB, Operand res, BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.op = op;
        this.res = res;
        this.lhs = lhs;
        this.rhs = rhs;
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
        if (! (lhs instanceof ConstInt))
            res.add(lhs);
        if (! (rhs instanceof ConstInt))
            res.add(rhs);
        return res;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);
        if (lhs instanceof Variable)
            lhs = renameMap.get(lhs);
        if (rhs instanceof Variable)
            rhs = renameMap.get(rhs);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new CmpInst(BBRenameMap.get(curBB), regRenameMap.get(res), op, regRenameMap.getOrDefault(lhs, lhs), regRenameMap.getOrDefault(rhs, rhs));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (lhs instanceof VirReg)
            lhs = NewNameForUse(reg_infoMap, (VirReg) lhs);
        if (rhs instanceof VirReg)
            rhs = NewNameForUse(reg_infoMap, (VirReg) rhs);
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (res instanceof VirReg)
            res = NewNameForDef(reg_infoMap, (VirReg) res);
    }
}
