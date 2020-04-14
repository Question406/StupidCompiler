package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BranchInst extends Instruction {
    public BasicBlock trueBB;
    public BasicBlock elseBB;
    public Operand cond;

    public BranchInst(BasicBlock BB, Operand cond, BasicBlock trueBB, BasicBlock elseBB) {
        super(BB);
        this.cond = cond;
        this.trueBB = trueBB;
        this.elseBB = elseBB;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return null;
    }

    public BasicBlock getTrueBB() {
        return trueBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> res = new ArrayList<Operand>();
        if (! (cond instanceof ConstInt))
            res.add(cond);
        return res;
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
        if (cond instanceof Variable)
            cond = renameMap.get(cond);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new BranchInst(BBRenameMap.get(curBB), regRenameMap.getOrDefault(cond, cond), BBRenameMap.get(trueBB), BBRenameMap.get(elseBB));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (cond instanceof VirReg) {
            cond = NewNameForUse(reg_infoMap, (VirReg) cond);
            ((VirReg) cond).usedInstructions.add(inInst);
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (cond == virReg)
            cond = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        assert false;
    }
}
