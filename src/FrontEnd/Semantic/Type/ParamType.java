package FrontEnd.Semantic.Type;

import IR.Operand.Operand;

public class ParamType extends Type {
    public ParamType(String name, int size) {
        super(name, size);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof ParamType);
    }

    @Override
    int size() {
        return 0;
    }

    @Override
    public String toString() {
        return "paratype " + name;
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
