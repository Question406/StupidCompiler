package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Operand;

public class MoveInst extends Instruction {
    public Operand moveTo;
    public Operand moveFrom;

    public MoveInst(BasicBlock BB, Operand moveTo, Operand res) {
        super(BB);
        this.moveTo = moveTo;
        this.moveFrom = res;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
