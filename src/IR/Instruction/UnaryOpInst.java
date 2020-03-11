package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;
import Utils.UnaryOperator;

public class UnaryOpInst extends Instruction{
    public UnaryOperator op;
    public Operand res;
    public Operand src;

    public UnaryOpInst(BasicBlock BB, Operand res, UnaryOperator op, Operand src) {
        super(BB);
        this.res = res;
        this.op = op;
        this.src = src;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
