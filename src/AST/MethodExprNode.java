package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Entity.FunctionEntity;
import Utils.Location;

import java.util.ArrayList;

public class MethodExprNode extends ExprNode {
    ExprNode whose;
    ArrayList<ExprNode> paras;
    FunctionEntity whoseEntity;

    public MethodExprNode(Location location, ExprNode whose, ArrayList<ExprNode> paras) {
        super(location);
        this.whose = whose;
        this.paras = paras;
    }

    public ExprNode getWhose(){
        return whose;
    }

    public ArrayList<ExprNode> getParas(){
        return paras;
    }

    // only a.add(x, y, z) : functionEntity
    public void setWhoseEntity(FunctionEntity whoseEntity) {
        this.whoseEntity = whoseEntity;
    }

    public FunctionEntity getWhoseEntity() {
        return whoseEntity;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "MethodExprNode{" +
                "whose=" + whose +
                ", paras=" + paras +
                ", whoseEntity=" + whoseEntity +
                '}';
    }
}