package FrontEnd.Semantic.Type;

import AST.FunctionTypeNode;
import AST.TypeNode;
import IR.Operand.Operand;

import java.util.ArrayList;

public class FunctionType extends Type {
    Type returnType;
    ArrayList<Type> paramTypes;

    public FunctionType(String name, Type returnType, ArrayList<Type> paramTypes) {
        super(name, 0);
        this.returnType = returnType;
        this.paramTypes = paramTypes;
    }

    @Override
    public boolean isSameType(Type other) {
        // FIXME: not sure
        if (other instanceof FunctionType)
            return (returnType.isSameType(((FunctionType) other).returnType));
        else
            return false;
    }

    @Override
    int size() {
        return 0;
    }

    @Override
    public String toString() {
        return "FunctionType{" +
                "returnType=" + returnType +
                ", paramTypes=" + paramTypes +
                '}';
    }

    public Type getReturnType() {
        return returnType;
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
