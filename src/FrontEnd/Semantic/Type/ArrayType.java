package FrontEnd.Semantic.Type;

import IR.Operand.Operand;
import Utils.CompileOption;

public class ArrayType extends Type {
    Type baseType;
    int dim;
    FunctionType builtInMethod;

    public ArrayType(Type baseType, int dim) {
        super(baseType.name, baseType.size);
        this.baseType = baseType;
        this.dim = dim;
        builtInMethod = new FunctionType("size", new IntegerType(), null);
    }

    @Override
    public boolean isSameType(Type other) {
        if (other instanceof ArrayType)
            return (baseType.isSameType(((ArrayType) other).baseType)) && (dim == ((ArrayType) other).dim);
        else
            return false;
    }

    @Override
    int size() {
        return CompileOption.INTSIZE;
    }

    public boolean hasMethod(String methodName) {
        return (methodName.equals("size"));
    }

    public FunctionType getMethodType(String methodName) {
        return builtInMethod;
    }

    public Type getBaseType() {
        return baseType;
    }

    public int getDim(){
        return dim;
    }

    @Override
    public String toString() {
        return "ArrayType{" +
                "baseType=" + baseType +
                ", dim=" + dim +
                ", builtInMethod=" + builtInMethod +
                '}';
    }


    // TODO: don't know what to write here now
    @Override
    public Operand getDefaultInit() {
        return null;
    }
}
