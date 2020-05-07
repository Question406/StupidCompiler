package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StoreInst extends Instruction {
    public Operand storeTo; // works as a pointer
    public Operand res;

    // for riscv
    public int byteSize;
    public int offset;
    public Operand helper;

    public StoreInst(BasicBlock BB, Operand storeTo, Operand res) {
        super(BB);
        this.storeTo = storeTo;
        this.res = res;
    }

    public StoreInst(BasicBlock BB, Operand storeTo, Operand res, int byteSize) {
        super(BB);
        this.storeTo = storeTo;
        this.res = res;
        this.byteSize = byteSize;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public Operand getDefReg() {
        return null;
    }

    @Override
    public List<Operand> getUseRegs() {
        ArrayList<Operand> retval = new ArrayList<Operand>();
        if (!(storeTo instanceof ConstInt))
            retval.add(storeTo);
        if (!(res instanceof ConstInt))
            retval.add(res);
        return retval;
    }

    @Override
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (res instanceof Variable)
            res = renameMap.get(res);
        if (storeTo instanceof Variable)
            storeTo = renameMap.get(storeTo);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new StoreInst(BBRenameMap.get(curBB), regRenameMap.get(storeTo), regRenameMap.getOrDefault(res, res));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (res instanceof VirReg) {
            res = NewNameForUse(reg_infoMap, (VirReg) res);
            ((VirReg) res).usedInstructions.add(inInst);
        }
        if (storeTo instanceof VirReg) {
            storeTo = NewNameForUse(reg_infoMap, (VirReg) storeTo);
            ((VirReg) storeTo).usedInstructions.add(inInst);
        }
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        assert false;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        if (res == virReg)
            res = constInt;
        if (storeTo == virReg)
            storeTo = constInt;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        if (storeTo == virReg)
            storeTo = constString;
        if (res == virReg)
            res = constString;
    }

    @Override
    public void CalcDefUseSet() {
        Def.clear();
        Use.clear();
        if (storeTo instanceof VirReg)
            Use.add((VirReg) storeTo);
        Use.add((VirReg) res);
        if (helper != null)
            Use.add((VirReg) helper);
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {
        if (storeTo == use)
            storeTo = changeTo;
        if (res == use)
            res = changeTo;
        if (helper == use)
            helper = changeTo;
    }
}