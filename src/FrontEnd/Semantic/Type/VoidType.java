package FrontEnd.Semantic.Type;

import IR.Operand.Operand;

public class VoidType extends Type {

    public VoidType() {
        super("void", 0);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof VoidType);
    }

    @Override
    int size() {
        return 0;
    }

    @Override
    public String toString() {
        return "voidType";
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
