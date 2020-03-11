package FrontEnd.Semantic.Type;


import AST.ConstructorDefNode;

import java.util.ArrayList;

public class ConstructorType extends FunctionType {
    public ConstructorType(String name, ArrayList<Type> paramTypes) {
        super(name, new VoidType(), paramTypes);
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof ConstructorType);
    }

    @Override
    int size() {
        return 0;
    }
}
