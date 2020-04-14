package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.*;
import Optim.SSAConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PhiInst extends Instruction {
    public Operand res;
    public Map<BasicBlock, Operand> from;

    public PhiInst(BasicBlock BB, Operand res) {
        super(BB);
        this.res = res;
        from = new HashMap<BasicBlock, Operand>();
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
        return new ArrayList<Operand>(from.values());
    }

    @Override
    public void renameGlobal(Map<Variable, VirReg> renameMap) {

    }

    @Override
    public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap) {
        return null;
    }

    @Override
    public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst) {
        assert false;
    }

    @Override
    public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap) {
        assert false;
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstInt constInt) {
        for (var entry : from.entrySet()) {
            var opr = entry.getValue();
            if (opr == virReg)
                entry.setValue(constInt);
        }
    }

    @Override
    public void modifyUseTOConst(VirReg virReg, ConstString constString) {
        for (var entry : from.entrySet()) {
            var opr = entry.getValue();
            if (opr == virReg)
                entry.setValue(constString);
        }
    }

    public void rmFrom(BasicBlock toRMbb) {
        from.remove(toRMbb);
        if (from.size() == 1) {  // doen't need to be phi
            Instruction newMove = new MoveInst(curBB, res, from.values().iterator().next());
            Instruction toPutBefore = this; // find the one put before
            while (toPutBefore instanceof PhiInst)
                toPutBefore = toPutBefore.next;
            toPutBefore.linkPrev(newMove);
            this.RMSelf();
        }
    }

    public void replaceFrom(BasicBlock toDOBB, BasicBlock newBB) {
        var operand = from.get(toDOBB);
        assert (operand instanceof ConstInt);
        from.remove(toDOBB);
        from.put(newBB, operand);
    }
}
