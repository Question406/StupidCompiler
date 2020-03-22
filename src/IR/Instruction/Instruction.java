package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;

public abstract class Instruction {
    public BasicBlock curBB;
    public Instruction prev;
    public Instruction next;

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
            next = inst;
        }

    }

    public void linkPrev(Instruction inst) {
        if (prev == null) {
            prev = inst;
            inst.next = this;
        } else {
            prev.next = inst;
            inst.next = this;
            prev = inst;
        }
    }

    abstract public void accept(IRVisitor visitor);

    public boolean isBranchInst() {
        return this instanceof BranchInst || this instanceof JumpInst;
    }
}
