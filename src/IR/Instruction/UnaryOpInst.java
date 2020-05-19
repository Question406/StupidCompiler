package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;
import Utils.UnaryOperator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UnaryOpInst extends Instruction {
    public UnaryOperator op;
    public Operand res;
    public Operand src;

    public boolean isImmInst;
    public RISCV.BinaryOperator riscvop;

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
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (res instanceof Variable || res instanceof ConstString)
            res = renameMap.get(res);
        if (src instanceof Variable || src instanceof ConstString)
            src = renameMap.get(src);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new UnaryOpInst(BBRenameMap.get(curBB), regRenameMap.get(res), op, regRenameMap.getOrDefault(src, src));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (src instanceof VirReg) {
            src = NewNameForUse(reg_infoMap, (VirReg) src);
            ((VirReg) src).usedInstructions.add(inInst);
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
        if (src == virReg)
            src = constInt;
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

    @Override
    public void replaceUse(Operand use, Operand changeTo) {
        if (src == use)
            src = changeTo;
    }
}
