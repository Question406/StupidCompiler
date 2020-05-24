package FrontEnd.Semantic.Type;


import AST.FunctionTypeNode;
import AST.TypeNode;
import AST.VarTypeNode;
import Utils.Location;

import java.util.ArrayList;

public class StringType extends ClassType {
    public StringType(long size) {
        super("string");
        Location loc = new Location(0, 0);
        ArrayList<FunctionTypeNode> methods = new ArrayList <FunctionTypeNode>();
        // *.length();
        methods.add(new FunctionTypeNode(loc, "length", new VarTypeNode(loc, "int"), null));
        // *.substring(left, right);
        ArrayList<TypeNode> params = new ArrayList<TypeNode>();
        params.add(new VarTypeNode(loc, "int"));
        params.add(new VarTypeNode(loc, "int"));
        // FIXME: a trick for returnType
        methods.add(new FunctionTypeNode(loc, "substring",new VarTypeNode(loc, "string") , params));

        // int parseInt();
        methods.add(new FunctionTypeNode(loc,"parseInt", new VarTypeNode(loc, "int"), null));

        // int ord(int pos);
        params = new ArrayList<TypeNode>();
        params.add(new VarTypeNode(loc, "int"));
        methods.add(new FunctionTypeNode(loc, "ord", new VarTypeNode(loc, "int"), params));

        this.inClassVars = null;
        this.constructors = null;
        this.inClassMethods = methods;
    }

    @Override
    public boolean isSameType(Type other) {
        return (other instanceof StringType);
    }

    @Override
    int size() {
        return 4;
    }

    @Override
    public String toString() {
        return "StringType";
    }
}
