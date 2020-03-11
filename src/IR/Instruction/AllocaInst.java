package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;

public class AllocaInst extends Instruction {
    Operand reg;
    Operand allocSize;

    public AllocaInst(BasicBlock BB, Operand reg, Operand object) {
        super(BB);
        this.reg = reg;
        this.allocSize = object;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public Operand getReg() {
        return reg;
    }

    public Operand getAllocSize() {
        return allocSize;
    }
}
