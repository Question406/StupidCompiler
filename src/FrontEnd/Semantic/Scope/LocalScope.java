package FrontEnd.Semantic.Scope;

import AST.DefNode;
import AST.TypeNode;
import AST.VarDefNode;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.VariableEntity;
import Utils.Exception.SemanticException;

import java.util.LinkedHashMap;
import java.util.Map;

public class LocalScope extends Scope {
    Scope parent;
    Map<String, VariableEntity> variables;

    public LocalScope(Scope parent) {
        super();
        this.parent = parent;
        parent.addChild(this);
        variables = new LinkedHashMap<String, VariableEntity>();
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
        VariableEntity var = variables.get(name);
        if (var == null)
            return parent.get(name);
        else {
            return var;
        }
    }

    @Override
    public void registerEntity(DefNode node) throws Exception {
        if (! (node instanceof VarDefNode))
            throw new SemanticException("Local scope should only register variable");
        else
            registerVariable((VarDefNode) node);
    }

    public boolean isDefinedLocally(String name) {
        return variables.containsKey(name);
    }

    public void registerVariable(VariableEntity variableEntity) throws SemanticException {
        if (variables.containsKey(variableEntity.getName())) {
            throw new SemanticException("duplicated variable: " + variableEntity.getName());
        }
        variables.put(variableEntity.getName(), variableEntity);
    }

    // may be many for node like int a, b;
    public void registerVariable(VarDefNode node) throws SemanticException {
        var name = node.getID();
        var init = node.getVarInit();
        TypeNode type = node.getType();
//        for (int i = 0; i < names.size(); i++) {
//            String name = names.get(i);
//            if (variables.containsKey(name)) {
//                throw new SemanticException("duplicated variable: " + name);
//            }
//            variables.put(name, new VariableEntity(type, name, init.get(i)));
//        }
        if (variables.containsKey(name))
            throw new SemanticException("duplicated variable: " + name);
        else
            variables.put(name, new VariableEntity(type, name, init));
    }

    public Map<String, VariableEntity> getLocalEntityMap() {
        return variables;
    }
}
