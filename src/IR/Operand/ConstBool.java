package IR.Operand;

import IR.IRVisitor;

public class ConstBool extends Constant {
    boolean value;

    public ConstBool(boolean value) {
        this.value = value;
    }

}
