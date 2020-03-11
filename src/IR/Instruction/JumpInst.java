package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;

public class JumpInst extends Instruction {
    public BasicBlock jumpTo;

    public JumpInst(BasicBlock BB, BasicBlock jumpTo) {
        super(BB);
        this.jumpTo = jumpTo;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public BasicBlock getJumpTo() {
        return jumpTo;
    }
}
