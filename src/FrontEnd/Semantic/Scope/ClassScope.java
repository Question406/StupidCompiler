package FrontEnd.Semantic.Scope;

import AST.*;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import FrontEnd.Semantic.Type.ClassType;
import Utils.Exception.SemanticException;

import java.util.LinkedHashMap;
import java.util.Map;

public class ClassScope extends Scope {
    GlobalScope parent;
    Map<String, Entity> ClassEntityMap;
    ClassType classType;

    public ClassScope(GlobalScope parent) {
        super();
        this.parent = parent;
        ClassEntityMap = new LinkedHashMap<String, Entity>();
        parent.addChild(this);
    }

    public void setClassType(ClassType classType) {
        this.classType = classType;
    }

    public ClassType getClassType() {
        return classType;
    }

    @Override
    public boolean isGlobal() {
        return false;
    }

    @Override
    public Scope parent() {
        return parent;
    }

    @Override
    public Entity get(String name) throws SemanticException {
        Entity entity = ClassEntityMap.get(name);
        if (entity == null)
            return parent.get(name);
        else {
            return entity;
        }
    }

    // Highlight: Goal : Function Overload supported
    public void registerEntity(DefNode def) throws SemanticException {
        // For funcdef node :
        if (def instanceof FuncDefNode) {
            FunctionEntity entity = new FunctionEntity((FuncDefNode) def, def instanceof ConstructorDefNode);
            String name = entity.getName();
            Entity e = ClassEntityMap.get(name);
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
                    } while (ClassEntityMap.get(tmp_funcname) == null);
                    ClassEntityMap.put(tmp_funcname, entity);
                }
            } else {
                // func name can be the same with an var
                ClassEntityMap.put(name, entity);
            }
        }
        else if (def instanceof VarDefNode) {
            TypeNode type = ((VarDefNode) def).getType();
            var name = ((VarDefNode) def).getID();
            var initExpr = ((VarDefNode) def).getVarInit();
            Entity e = ClassEntityMap.get(name);
            if (e != null)
                throw new SemanticException("duplicated def of var : " + name);
            else {
                VariableEntity entity = new VariableEntity(type, name, initExpr);
                ClassEntityMap.put(name, entity);
            }
        } else {
            throw new SemanticException("unkown error at registerEntity");
        }
    }

    // already have these
    public void registerEntity(String name, Entity entity) {
        if (ClassEntityMap.containsKey(name))
            throw new SemanticException("duplicated def of " + name + " " + entity.getClass());
        else
            ClassEntityMap.put(name, entity);
    }


    // highlight: for unused remover
    public Map<String, Entity> getClassEntityMap() {
        return ClassEntityMap;
    }
}
