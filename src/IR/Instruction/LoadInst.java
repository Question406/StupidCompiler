package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LoadInst extends Instruction {
    public Operand from;
    public Operand res;
    public int byteSize;

    public LoadInst(BasicBlock BB, Operand res, Operand from) {
        super(BB);
        this.res = res;
        this.from = from;
    }

    public LoadInst(BasicBlock BB, Operand res, Operand from, int byteSize) {
        super(BB);
        this.res = res;
        this.from = from;
        this.byteSize = byteSize;
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
    public void renameGlobal(Map<Operand, VirReg> renameMap) {
        if (res instanceof Variable || res instanceof ConstString)
            res = renameMap.get(res);
        if (from instanceof Variable || res instanceof ConstString)
            from = renameMap.get(from);
    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return new LoadInst(BBRenameMap.get(curBB), regRenameMap.get(res), regRenameMap.getOrDefault(from, from));
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        if (from instanceof VirReg) {
            from = NewNameForUse(reg_infoMap, (VirReg) from);
            ((VirReg) from).usedInstructions.add(inInst);
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
        if (from == virReg)
            from = constInt;
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
        if (from instanceof VirReg)
            Use.add((VirReg) from);
    }

    @Override
    public void replaceUse(VirReg use, VirReg changeTo) {
        if (from == use)
            from = changeTo;
    }

    @Override
    public void replaceUse(Operand use, Operand changeTo) {
        if (from == use)
            from = changeTo;
    }
}
