package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Addr;
import IR.Operand.Operand;
import IR.Operand.Pointer;

public class LoadInst extends Instruction {
    public Pointer from;
    public Operand res;

    public LoadInst(BasicBlock BB, Operand res, Pointer from) {
        super(BB);
        this.res = res;
        this.from = from;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
