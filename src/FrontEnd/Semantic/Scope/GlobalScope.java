package FrontEnd.Semantic.Scope;

import AST.*;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import FrontEnd.Semantic.Type.Type;
import FrontEnd.Semantic.Type.TypeTable;
import Utils.Exception.SemanticException;
import Utils.Location;

import javax.management.StandardEmitterMBean;
import java.time.temporal.ValueRange;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Function;

public class GlobalScope extends Scope {
    Map<String, Entity> entityMap;

    // highlight: transfer it to IR
    TypeTable typeTable;

    public GlobalScope() {
        super();
        entityMap = new LinkedHashMap<String, Entity>();
    }

    @Override
    public boolean isGlobal() {
        return true;
    }

    @Override
    public Scope parent() {
        return null;
    }

    public void setTypeTable(TypeTable typeTable) {
        this.typeTable = typeTable;
    }

    public TypeTable getTypeTable() {
        return typeTable;
    }

    @Override
    public Entity get(String name) throws SemanticException {
        Entity entity = entityMap.get(name);
        if (entity == null)
            throw new SemanticException("unresolved reference : " + name);

        return entity;
    }

    // Highlight: Goal : Function Overload supported
    public void registerEntity(DefNode def) throws SemanticException {
        // For funcdef node :
        if (def instanceof FuncDefNode) {
            FunctionEntity entity = new FunctionEntity((FuncDefNode) def, def instanceof ConstructorDefNode);
            String name = entity.getName();
            Entity e = entityMap.get(name);
            if (e != null && e instanceof FunctionEntity) {
                // for function Overload
                if (((FunctionEntity) e).isSameFunction(entity))
                    throw new SemanticException("duplicated def of function: " + entity.getName() + " : " + e.getName());
                else {
                    int i = 0;
                    String tmp_funcname;
                    do {
                        i++;
                        tmp_funcname = name + i;
                    } while (entityMap.get(tmp_funcname) != null);
                    entityMap.put(tmp_funcname, entity);
                }
            } else {
                // func name can be the same with an var
                entityMap.put(name, entity);
            }
        }
        else if (def instanceof VarDefNode) {
            TypeNode type = ((VarDefNode) def).getType();
            var name = ((VarDefNode) def).getID();
            var initExpr = ((VarDefNode) def).getVarInit();
            Entity e = entityMap.get(name);
            if (e != null)
                throw new SemanticException("duplicated def of var : " + name);
            else {
                VariableEntity entity = new VariableEntity(type, name, initExpr);
                entityMap.put(name, entity);
            }
        } else {
            throw new SemanticException("unkown error at registerEntity");
        }
    }

    public void put(String name, Entity entity) {
        if (entityMap.containsKey(name))
            throw new SemanticException("duplicated def of entity " + name);
        else
            entityMap.put(name, entity);
    }

    // void print(string str);
    // void println(string str);
    // void printInt(int n);
    // void printlnInt(int n);
    // string getString();
    // int getInt();
    // string toString(int i);

    //FIXME: scope for built_in func ?
    public void registerBuiltInFuncs() {
        Location loc = new Location(0, 0);
        FunctionEntity entity;
        ArrayList<VariableEntity> param = new ArrayList<VariableEntity>();

        // void print(string str)
        param.add(new VariableEntity(new VarTypeNode(loc, "string"), "str", null));
        entity = new FunctionEntity(new VoidTypeNode(loc, "void"), new String("print"), param, null, null);
        entityMap.put("print", entity);

        // void println(string str);
        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "string"), "str", null));
        entity = new FunctionEntity(new VoidTypeNode(loc, "void"), new String("println"), param, null, null);
        entityMap.put("println", entity);

        // void printInt(int n);
        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "n", null));
        entity = new FunctionEntity(new VoidTypeNode(loc, "void"), new String("printInt"), param, null, null);
        entityMap.put("printInt", entity);

        // void printIntln(int n);
        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "n", null));
        entity = new FunctionEntity(new VoidTypeNode(loc, "void"), new String("printIntln"), param, null, null);
        entityMap.put("printlnInt", entity);

        // string toString(int i);
        param = new ArrayList<VariableEntity>();
        param.add(new VariableEntity(new VarTypeNode(loc, "int"), "i", null));
        entity = new FunctionEntity(new VarTypeNode(loc, "string"), new String("toString"), param, null, null);
        entityMap.put("toString", entity);

        // string getString();
        param = null;
        entity = new FunctionEntity(new VarTypeNode(loc, "string"), new String("getString"), param, null, null);
        entityMap.put("getString", entity);

        // int getInt();
        param = null;
        entity = new FunctionEntity(new VarTypeNode(loc, "int"), new String("getInt"), param, null, null);
        entityMap.put("getInt", entity);
    }

    public Map<String, Entity> getGlobalEntityMap() {
        return entityMap;
    }
}
