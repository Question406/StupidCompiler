package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.ConstInt;
import IR.Operand.ConstString;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Optim.SSAConstructor;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class Instruction {
    public BasicBlock curBB;
    public Instruction prev;
    public Instruction next;

    // for reg allocate
    public Set<VirReg> Use = new HashSet<VirReg>();
    public Set<VirReg> Def = new HashSet<VirReg>();
    public Set<VirReg> LiveIn = new HashSet<VirReg>();
    public Set<VirReg> LiveOut = new HashSet<VirReg>();

    public Instruction(BasicBlock BB) {
        curBB = BB;
    }

    public void linkNext(Instruction inst) {
        if (next == null) {
            next = inst;
            inst.prev = this;
        } else {
            next.prev = inst;
            inst.next = next;
            inst.prev = this;
            next = inst;
        }

    }

    public void linkPrev(Instruction inst) {
        if (prev == null) {
            prev = inst;
            inst.next = this;
            inst.prev = null;
            curBB.insthead = inst;
        } else {
            prev.next = inst;
            inst.next = this;
            inst.prev = prev;

            prev = inst;
        }
    }

    public BasicBlock getCurBB() {
        return curBB;
    }

    public void RMSelf() {
        if (this == curBB.insthead) curBB.insthead = this.next;
        if (this == curBB.insttail) curBB.insttail = this.prev;
        if (this.prev != null) this.prev.next = this.next;
        if (this.next != null) this.next.prev = this.prev;
    }

    abstract public void accept(IRVisitor visitor);

    public boolean isBranchInst() {
        return this instanceof BranchInst || this instanceof JumpInst || this instanceof RetInst;
    }

    protected VirReg NewNameForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, VirReg toDO) {
        var reg_info = reg_infoMap.get(toDO);
        var i = reg_info.name_counter;
        reg_info.name_counter++;
        reg_info.name_Stack.push(i);
        return toDO.getSSANewName(i);
    }

    protected VirReg NewNameForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, VirReg toDO) {
        var reg_info = reg_infoMap.get(toDO);
        var i = reg_info.name_Stack.peek();
        return toDO.getSSANewName(i);
    }

    abstract public Operand getDefReg();

    abstract public List<Operand> getUseRegs();

    abstract public void renameGlobal(Map<Operand, VirReg> renameMap);

    abstract public Instruction CopySelfWithNewName(Map<Operand, Operand> regRenameMap, Map<BasicBlock, BasicBlock> BBRenameMap);

    abstract public void renameSSAForUse(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap, Instruction inInst);

    abstract public void renameSSAForDef(Map<VirReg, SSAConstructor.ssa_reg_info> reg_infoMap);

    abstract public void modifyUseTOConst(VirReg virReg, ConstInt constInt);

    abstract public void modifyUseTOConst(VirReg virReg, ConstString constString);

    // Reg allocate
    abstract public void CalcDefUseSet();

    abstract public void replaceUse(VirReg use, VirReg changeTo);

    abstract public void replaceUse(Operand use, Operand changeTo);
}
