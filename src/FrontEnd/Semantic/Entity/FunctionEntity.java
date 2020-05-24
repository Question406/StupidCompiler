package FrontEnd.Semantic.Entity;

import AST.BlockStatNode;
import AST.FuncDefNode;
import AST.TypeNode;
import AST.VoidTypeNode;
import FrontEnd.Semantic.Scope.LocalScope;
import FrontEnd.Semantic.Scope.Scope;

import java.util.ArrayList;

public class FunctionEntity extends Entity {
    ArrayList<VariableEntity> paramList;
    Scope scope;
    BlockStatNode body;
    Boolean isConstructor;
    Boolean isInClass;

    public FunctionEntity(TypeNode type, String name) {
        super(type, name);
        isInClass = false;
    }

    public FunctionEntity(TypeNode type, String name, ArrayList<VariableEntity> param, Scope scope, BlockStatNode body) {
        super(type, name);
        this.paramList = param;
        this.scope = scope;
        this.body = body;
        isConstructor = false;
        isInClass = false;
    }

    public FunctionEntity(FuncDefNode def, boolean isConstructor) {
        super(def.getFunctype(), def.getFuncName());
        paramList = null;
        // set variables
        var paras = def.getParas();
        if (paras != null) {
            paramList = new ArrayList<>();
            for (var para : paras)
                paramList.add(new VariableEntity(para.getType(), para.getID(), para.getVarInit()));
        }
        body = def.getFuncbody();
        this.isConstructor = isConstructor;
        isInClass = false;
    }

    public void setInClass(Boolean inClass) {
        isInClass = inClass;
    }

    public Boolean getInClass() {
        return isInClass;
    }

    public void setScope(LocalScope scope) {
        this.scope = scope;
    }

    public ArrayList<VariableEntity> getParamList() {
        return paramList;
    }

    public boolean isSameFunction(FunctionEntity entity) {
        // same return type
        if (!this.type.name().equals(entity.type.name()) || paramList.size() != entity.paramList.size()) return false;
        // same param type
        for (int i = 0; i < paramList.size(); i++)
            if (! paramList.get(i).type.name().equals(entity.paramList.get(i).type.name()))
                return false;
        return true;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean isVoid() {
        return this.type instanceof VoidTypeNode;
    }

    public void setIsConstructor(Boolean set) {
        isConstructor = set;
    }

    public Boolean isConstructor() {
        return isConstructor;
    }

}
