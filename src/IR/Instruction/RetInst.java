package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;

public class RetInst extends Instruction {
    Operand retVal;

    public RetInst(BasicBlock BB, Operand retVal) {
        super(BB);
        this.retVal = retVal;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public Operand getRetVal() {
        return retVal;
    }
}
