package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import Utils.BinaryOperator;

public class CmpInst extends Instruction {
    public BinaryOperator op;
    public Operand res;
    public Operand lhs;
    public Operand rhs;

    public CmpInst(BasicBlock BB, Operand res, BinaryOperator op, Operand lhs, Operand rhs) {
        super(BB);
        this.op = op;
        this.res = res;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
