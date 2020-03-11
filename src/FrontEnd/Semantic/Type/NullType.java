package FrontEnd.Semantic.Type;

import IR.Operand.Operand;

public class NullType extends Type{

    public NullType() {
        super("null", 1);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof NullType);
    }

    @Override
    int size() {
        return 0;
    }

    @Override
    public String toString() {
        return "nullType";
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
