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

    public boolean isImmInst;
    public RISCV.BinaryOperator riscvop;

    public BinOpInst(BasicBlock BB, Operand res, BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.lhs = lhs;
        this.res = res;
        this.op = op;
        this.rhs = rhs;
    }

    public BinOpInst(BasicBlock BB, Operand res, RISCV.BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.lhs = lhs;
        this.res = res;
        this.riscvop = op;
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
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);
        if (lhs instanceof Variable)
            lhs = renameMap.get(lhs);
        if (rhs instanceof Variable)
            rhs = renameMap.get(rhs);
        if (res instanceof ConstString)
            res = renameMap.get(res);
        if (lhs instanceof ConstString)
            lhs = renameMap.get(lhs);
        if (rhs instanceof ConstString)
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

    @Override
    public void CalcDefUseSet() {
        Def.clear();
        Use.clear();
        Def.add((VirReg) res);
        Use.add((VirReg) lhs);
        if (!isImmInst) {
            if (rhs instanceof ConstInt) {
                System.err.println("fuck");
            }
            Use.add((VirReg) rhs);
        }
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {
        if (lhs == use)
            lhs = changeTo;
        if (!isImmInst) {
            if (rhs == use)
                rhs = changeTo;
        }
    }
}
