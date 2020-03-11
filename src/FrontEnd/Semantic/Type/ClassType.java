package FrontEnd.Semantic.Type;

import AST.ConstructorTypeNode;
import AST.FunctionTypeNode;
import AST.TypeNode;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import IR.Operand.Operand;
import Utils.CompileOption;
import Utils.Tuple;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class ClassType extends Type {
    ArrayList<Tuple> inClassVars;
    ArrayList<ConstructorTypeNode> constructors;
    ArrayList<FunctionTypeNode> inClassMethods;

    // only for string
    public ClassType(String name) {
        super(name, CompileOption.INTSIZE);
    }

    public ClassType(String name, int size, ArrayList<Tuple> inClassVars, ArrayList<ConstructorTypeNode> constructors, ArrayList<FunctionTypeNode> inClassMethod) {
        super(name, size);
        size = 0;
        for (var tuple : inClassVars)
            size += tuple.getType().allocsize();
        this.inClassVars = inClassVars;
        this.constructors = constructors;
        this.inClassMethods = inClassMethod;
    }

    public int getOffSet(String varID) {
        int res = 0;
        for (var tuple : inClassVars) {
            if (tuple.getName().equals(varID))
                return res;
            else
                res += tuple.getType().allocsize();
        }
        return res;
    }

    @Override
    public boolean isSameType(Type other) {
        if (! (other instanceof ClassType))
            return false;
        return name.equals(other.name);
    }

    @Override
    int size() {
        return size;
    }

    public boolean hasMethod(String methodName) {
        for (var type : inClassMethods) {
            if (type.name().equals(methodName)) return true;
        }
        return false;
    }

    public boolean hasVar(String varName) {
        for (var var : inClassVars) {
            if (var.getName().equals(varName))
                return true;
        }
        return false;
    }

//    public FunctionType getMethodType(String methodName) {
//        for (var type : inClassMethods) {
//            if (type.name.equals(methodName))
//                return type;
//        }
//        return null;
//    }

    // highlight: for a method, return the method TypeNode
    public TypeNode getMethodTypeNode(String methodName) {
        for (var type : inClassMethods) {
            if (type.name().equals(methodName))
                return type;
        }
        return null;
    }

    public TypeNode getVarType(String varname) {
        for (var tuple : inClassVars)
            if (tuple.getName().equals(varname)) {
                return tuple.getType();
            }
        return null;
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public String toString() {
        return "ClassType" + name + "{" +
                "inClassVars=" + inClassVars +
                ", constructors=" + constructors +
                ", inClassMethods=" + inClassMethods +
                '}';
    }

    @Override
    public Operand getDefaultInit() {
        return null;
    }

}
