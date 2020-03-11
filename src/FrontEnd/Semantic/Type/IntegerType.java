package FrontEnd.Semantic.Type;

import IR.Operand.Operand;
import Utils.CompileOption;

public class IntegerType extends Type {
    public IntegerType() {
        super("int", CompileOption.INTSIZE);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof IntegerType);
    }

    @Override
    int size() {
        return size;
    }

    @Override
    public String toString() {
        return "IntegerType";
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
