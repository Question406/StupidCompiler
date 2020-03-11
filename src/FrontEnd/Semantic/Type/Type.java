package FrontEnd.Semantic.Type;

import AST.*;
import IR.Operand.Operand;

abstract public class Type {
    String name;
    int size;

    public Type(String name, int size) {
        this.name = name;
        this.size = size;
    }

    public abstract boolean  isSameType(Type other);
    abstract int size();

    public String getName() {
        return name;
    }
    public int allocSize() { return size(); }
    public int alignment() { return size(); }

    public void setSize(int size) {
        this.size = size;
    }

    static private Type getType(String ID) {
        switch (ID) {
            case "int":
                return new IntegerType();
            case "bool":
                return new BoolType();
            case "string":
                return new StringType(0);
            case "void":
                return new VoidType();
        }
        return null;
    }

    // highlight: only ArrayType || int... will call this method
    static public Type getType(TypeNode node) throws Exception {
        if (node instanceof ArrayTypeNode) {
            Type baseType = getType(node.name());
            return new ArrayType(baseType, ((ArrayTypeNode) node).getDim());
        } else if (node instanceof VarTypeNode){
            return getType(node.name());
        } else if (node instanceof VoidTypeNode) {
            return new VoidType();
        }
        else {
            throw new Exception("unknown error at getType");
        }
    }

    abstract public String toString();
    public int hashCode() {
        return toString().hashCode();
    }

    // highlight: For IR
    abstract public Operand getDefaultInit();
}
