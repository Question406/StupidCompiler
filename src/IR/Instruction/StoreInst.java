package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.ConstInt;
import IR.Operand.Operand;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StoreInst extends Instruction {
    public Operand storeTo; // works as a pointer
    public Operand res;

    public StoreInst(BasicBlock BB, Operand storeTo, Operand res) {
        super(BB);
        this.storeTo = storeTo;
        this.res = res;
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
    public void renameGlobal(Map<Variable, VirReg> renameMap) {
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
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        if (res instanceof VirReg)
            res = NewNameForUse(reg_infoMap, (VirReg) res);
        if (storeTo instanceof VirReg)
             storeTo = NewNameForUse(reg_infoMap, (VirReg) storeTo);
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {

    }
}