package IR.Instruction;

import IR.BasicBlock;
import IR.IRVisitor;
import IR.Operand.Addr;
import IR.Operand.Operand;

public class StoreInst extends Instruction {
    public Operand storeTo; // works as a pointer
    public Operand res;

    public StoreInst(BasicBlock BB, Operand storeTo, Operand res) {
        super(BB);
        this.storeTo = storeTo;
        this.res = res;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}