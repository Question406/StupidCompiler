package FrontEnd.Semantic.Type;

import AST.*;
import Utils.Exception.SemanticException;
import Utils.Location;
import Utils.Tuple;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TypeTable {
    Map<TypeNode, Type> table;

    public TypeTable() {
        Location loc = new Location(0, 0);
        //table = new LinkedHashMap<TypeNode, Type>();
        table = new HashMap<TypeNode, Type>();

        table.put(new VoidTypeNode(loc, "void"), new VoidType());
        table.put(new VarTypeNode(loc, "int"), new IntegerType());
        table.put(new VarTypeNode(loc, "string"), new StringType(0));
        table.put(new VarTypeNode(loc, "bool"), new BoolType());
    }

    public void put(ClassDefNode def) {
        ClassTypeNode classTypeNode = def.getClassType();
        ClassType classType = null;
        if (table.containsKey(classTypeNode))
            throw new SemanticException("dulicated class def : " + def.getClassname());
        else {
            int size = 0;
            ArrayList<Tuple> varType = new ArrayList<Tuple>();
            ArrayList<ConstructorTypeNode> constructorTypes = new ArrayList<ConstructorTypeNode>();
            ArrayList<FunctionTypeNode> methodTypes = new ArrayList<FunctionTypeNode>();

            var vardefs = def.getInclassVar();
            var methods = def.getInclassMethod();
            for (VarDefNode vardef : vardefs) {
                TypeNode vardefType = vardef.getType();
                var name = vardef.getID();
                varType.add(new Tuple(vardefType, name));
                size += vardefType.allocsize();
            }
            for (FuncDefNode method : methods) {
                if (method instanceof ConstructorDefNode)
                    constructorTypes.add(new ConstructorTypeNode(method));
                else
                    methodTypes.add(new FunctionTypeNode(method));
            }
            classType = new ClassType(def.getClassname(), size, varType, constructorTypes, methodTypes);
            table.put(classTypeNode, classType);
        }
    }

    public Type get(TypeNode type) throws RuntimeException {
        if (type instanceof ArrayTypeNode) {
            if (!table.containsKey(((ArrayTypeNode) type).getBaseType()))
                throw new RuntimeException("type " + ((ArrayTypeNode) type).getBaseType() + " has no def");
            else {
                Type baseType = table.get(((ArrayTypeNode) type).getBaseType());
                return new ArrayType(baseType, ((ArrayTypeNode) type).getDim());
            }
        } else {
            if (!table.containsKey(type))
                throw new RuntimeException("have no def");
            else
                return table.get(type);
        }
    }

    public boolean isDefined(TypeNode type) {
        return table.containsKey(type);
    }

    public boolean hasName(String name) {
        for (var entry : table.entrySet()) {
            if (entry.getKey().name().equals(name))
                return true;
        }
        return false;
    }

}
