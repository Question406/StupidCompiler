package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import IR.Operand.VirReg;
import Utils.BinaryOperator;

public class BranchInst extends Instruction {
    public BasicBlock trueBB;
    public BasicBlock elseBB;
    public Operand cond;

    public BranchInst(BasicBlock BB, Operand cond, BasicBlock trueBB, BasicBlock elseBB) {
        super(BB);
        this.cond = cond;
        this.trueBB = trueBB;
        this.elseBB = elseBB;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public BasicBlock getTrueBB() {
        return trueBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }
}
