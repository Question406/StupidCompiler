package FrontEnd.Semantic.Type;

import IR.Operand.ConstBool;
import IR.Operand.Operand;
import Utils.CompileOption;

public class BoolType extends Type {

    public BoolType() {
        super("bool", CompileOption.BOOLSIZE);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof BoolType);
    }

    @Override
    int size() {
        return size;
    }

    @Override
    public String toString() {
        return "boolType";
    }


    @Override
    public Operand getDefaultInit() {
        return new ConstBool(false);
    }
}
