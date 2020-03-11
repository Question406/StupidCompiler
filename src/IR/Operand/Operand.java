package IR.Operand;

import IR.IRVisitor;

public class Operand {
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
