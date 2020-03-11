package IR;

import IR.Instruction.BranchInst;
import IR.Instruction.Instruction;
import IR.Instruction.JumpInst;
import IR.Instruction.RetInst;

import java.util.HashSet;
import java.util.Set;

public class BasicBlock {
    String name;
    Function func;
    public Instruction insthead;
    public Instruction insttail;

    Set<BasicBlock> predBBs;
    Set<BasicBlock> succBBs;

    boolean ended;

    public BasicBlock(Function func, String name) {
        ended = false;
        this.name = name;
        this.func = func;
        predBBs = new HashSet<BasicBlock>();
        succBBs = new HashSet<BasicBlock>();
    }

    public void addInst(Instruction inst) {
        if (insttail != null) {
            insttail.linkNext(inst);
            insttail = inst;
        } else {
            insthead = insttail = inst;
        }
    }

    public void addPredBB(BasicBlock BB) {
        predBBs.add(BB);
    }

    public void addSuccBB(BasicBlock BB) {
        succBBs.add(BB);
    }

    public void linkNextBB(BasicBlock BB) {
        this.addSuccBB(BB);
        BB.addPredBB(BB);
    }

    public void endBB(Instruction inst) {
        //
        if (! func.BBs.contains(this))
            func.BBs.add(this);

        addInst(inst);
        ended = true;
        if (inst instanceof JumpInst)
            this.linkNextBB(((JumpInst) inst).getJumpTo());
        else if (inst instanceof BranchInst) {
            this.linkNextBB(((BranchInst) inst).getTrueBB());
            this.linkNextBB(((BranchInst) inst).getElseBB());
        } else if (inst instanceof RetInst)
            func.addRetInst((RetInst) inst);
    }

    public boolean getEnded() {
        return ended;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public void removeRetInst() {
        if (insttail == null)
            throw new RuntimeException("remove inst from empty block");
        if (insthead == insttail)
            insthead = insttail = null;
        else {
            assert insttail != null;
            insttail = insttail.prev;
            insttail.next = null;
        }
    }

    public Set<BasicBlock> getSuccBBs() {
        return succBBs;
    }
}
