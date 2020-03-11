package FrontEnd.Semantic.Type;

import FrontEnd.Semantic.Entity.Entity;
import IR.Operand.Operand;

public class PointerType extends Type {
    Entity entity;

    public PointerType(String name, int size) {
        super(name, size);
    }

    @Override
    public boolean isSameType(Type other) {
        return false;
    }

    @Override
    int size() {
        return 0;
    }

    @Override
    public String toString() {
        return null;
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
