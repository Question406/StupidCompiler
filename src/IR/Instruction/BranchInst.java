package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import RISCV.RISCV_Info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BranchInst extends Instruction {
    public BasicBlock trueBB;
    public BasicBlock elseBB;
    public Operand cond;

    public CmpInst condInst = null;

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
        if (condInst != null){
            res.add(condInst.lhs);
            res.add(condInst.rhs);
        }
        return res;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
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

    @Override
    public void CalcDefUseSet() {
        Use.clear();
        Def.clear();
        if (condInst != null) {
            condInst.CalcDefUseSet();
            Use.addAll(condInst.Use);
        } else {
            Use.add((VirReg) cond);
            Use.add(RISCV_Info.virtualPhyRegs.get("zero"));
        }
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {
        if (condInst != null) {
            if (condInst.lhs == use)
                condInst.lhs = changeTo;
            if (condInst.rhs == use)
                condInst.rhs = changeTo;
        } else {
            if (cond == use)
                cond = changeTo;
        }
    }

    @Override
    public void replaceUse(Operand use, Operand changeTo) {
        if (cond == use)
            cond = changeTo;
    }

    public void modifyBranch(BasicBlock oldTO, BasicBlock newTO) {
        if (trueBB == oldTO)
            trueBB = newTO;
        else if (elseBB == oldTO)
            elseBB = newTO;
        else throw new RuntimeException("unexpected at modifyBranch");
    }
}
