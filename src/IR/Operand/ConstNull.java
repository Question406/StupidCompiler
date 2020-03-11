package IR.Operand;

import IR.IRVisitor;

public class ConstNull extends Constant {
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
