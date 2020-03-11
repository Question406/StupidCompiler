package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import Utils.BinaryOperator;

public class BinOpInst extends Instruction {
    public BinaryOperator op;
    public Operand res;
    public Operand lhs;
    public Operand rhs;

    public BinOpInst(BasicBlock BB, Operand res, BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.lhs = lhs;
        this.res = res;
        this.op = op;
        this.rhs = rhs;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
