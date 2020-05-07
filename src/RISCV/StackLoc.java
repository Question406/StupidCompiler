package RISCV;

import IR.Function;
import IR.IRVisitor;
import IR.Operand.Operand;

public class StackLoc extends Operand {
    public Function func;
    public boolean isCallerStack;
    public int idx;

    public StackLoc(Function function, boolean isCallerStack, int idx) {
        super(new String("stackloc"));
        this.func = function;
        this.isCallerStack = isCallerStack;
        this.idx = idx;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}