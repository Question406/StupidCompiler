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
    public int RPOnum = 0;

    public Set<BasicBlock> DomBBs;
    public Set<BasicBlock> DomFros;
    public Set<BasicBlock> predBBs;
    public Set<BasicBlock> succBBs;
    public BasicBlock IDom;

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
        BB.addPredBB(this);
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

    public void removeTail() {
        if (insttail == null)
            throw  new RuntimeException("remove inst from empty block");
        if (insthead == insttail) {
            insthead = insttail = null;
            for (var sucBB : succBBs)
                sucBB.predBBs.remove(this);
            
        }
        else {
            insttail = insttail.prev;
            insttail.next = null;
        }
    }

    public boolean isEmpty() {
        // only one inst and it's a branch inst
        return (insthead == insttail) &&
                (insthead instanceof JumpInst || insthead instanceof BranchInst);
    }

    public void newJumpTo(BasicBlock oldJumpBB, BasicBlock newJumpBB) {
        if (!insttail.isBranchInst())
            throw new RuntimeException("illegal newJumpTo Call");
        if (insttail instanceof JumpInst) {
            ((JumpInst) insttail).jumpTo = newJumpBB;
            succBBs.remove(oldJumpBB);
            succBBs.add(newJumpBB);
        }
        else if (insttail instanceof BranchInst) {
            if (((BranchInst) insttail).trueBB == oldJumpBB)
                ((BranchInst) insttail).trueBB = newJumpBB;
            else if (((BranchInst) insttail).elseBB == oldJumpBB)
                ((BranchInst) insttail).elseBB = newJumpBB;
            else
                throw new RuntimeException("illegal newJumpTo Call at branch inst");
            succBBs.remove(oldJumpBB);
            succBBs.add(newJumpBB);
        }
    }

    public void CombineBB(BasicBlock toCombine) {
        if (insttail == null && insthead == null) {
            insthead = toCombine.insthead;
            insttail = toCombine.insttail;
        }else {
            assert insttail != null;

            // reset insts from toCombine
            for (var inst = toCombine.insthead; inst != null; inst = inst.next)
                inst.curBB = this;


            // link Insts
            insttail.next = toCombine.insthead;
            toCombine.insthead.prev = insttail;
            insttail = toCombine.insttail;

            // RM from CFG
            toCombine.insthead = toCombine.insttail = null;
            toCombine.RMSelf();
        }
    }

    public void RMSelf() {
        for (var predBB : predBBs)
            predBB.succBBs.remove(this);
        for (var succBB : succBBs)
            succBB.predBBs.remove(this);
    }

    public Set<BasicBlock> getSuccBBs() {
        return succBBs;
    }
}
