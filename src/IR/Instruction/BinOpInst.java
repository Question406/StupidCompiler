package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import Utils.BinaryOperator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BinOpInst extends Instruction {
    public BinaryOperator op;
    public Operand res;
    public Operand lhs;
    public Operand rhs;

    public BinOpInst(BasicBlock BB, Operand res, BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.lhs = lhs;
        this.res = res;
        this.op = op;
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
        return new BinOpInst(BBRenameMap.get(curBB), regRenameMap.get(res), op, regRenameMap.getOrDefault(lhs, lhs), regRenameMap.getOrDefault(rhs, rhs));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (lhs instanceof VirReg) {
            lhs = NewNameForUse(reg_infoMap, (VirReg) lhs);
            ((VirReg) lhs).usedInstructions.add(inInst);
        }
        if (rhs instanceof VirReg) {
            rhs = NewNameForUse(reg_infoMap, (VirReg) rhs);
            ((VirReg) rhs).usedInstructions.add(inInst);
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
        if (lhs == virReg)
            lhs = constInt;
        if (rhs == virReg)
            rhs = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        assert false;
    }
}
