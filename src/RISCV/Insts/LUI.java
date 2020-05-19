package RISCV.Insts;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Instruction.Instruction;
import IR.Operand.ConstInt;
import IR.Operand.ConstString;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.List;
import java.util.Map;

public class LUI extends Instruction {
    public Operand res;
    public Operand from;

    public LUI(BasicBlock BB) {
        super(BB);
    }

    public LUI(BasicBlock BB, Operand res, Operand from) {
        super(BB);
        this.res = res;
        this.from = from;
    }

    @Override
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
    public void renameGlobal(Map<Operand, VirReg> renameMap) {

    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return null;
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {

    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {

    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {

    }

    @Override
    public void CalcDefUseSet() {
        Def.clear();
        Use.clear();
        Def.add((VirReg) res);
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {

    }

    @Override
    public void replaceUse(Operand use, Operand changeTo) {

    }
}
