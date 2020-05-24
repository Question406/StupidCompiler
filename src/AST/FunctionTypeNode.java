package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import java.util.ArrayList;

public class FunctionTypeNode extends TypeNode {
    TypeNode returnType;
    ArrayList<TypeNode> paramList;

    public FunctionTypeNode(Location location, String id, TypeNode returnType, ArrayList<TypeNode> paramList) {
        super(location, id);
        this.returnType = returnType;
        this.paramList = paramList;
    }

    public FunctionTypeNode(FuncDefNode def) {
        super(def.getLocation(), def.getFuncName());
        this.returnType = def.getFunctype();
        paramList = null;
        if (def.paras != null) {
            paramList = new ArrayList<TypeNode>();
            var params = def.getParas();
            for (var para : params)
                paramList.add(para.getType());
        }
    }

    public TypeNode getReturnType() {
        return returnType;
    }

    public ArrayList<TypeNode> getParamList() {
        return paramList;
    }

    // never used
    @Override
    public void accept(ASTVisitor visitor) throws Exception {
    }

    @Override
    public String toString() {
        return "FunctionTypeNode{" +
                "returnType=" + returnType +
                ", paramList=" + paramList +
                '}';
    }

    @Override
    public int allocsize() {
        return 0;
    }
}
