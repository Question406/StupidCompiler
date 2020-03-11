package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Type.ArrayType;
import Utils.Location;

import java.util.ArrayList;

public class NEWExprNode extends ExprNode {
    TypeNode type;
    ArrayList<ExprNode> dimExpr;

    public NEWExprNode(Location location, TypeNode type, ArrayList<ExprNode> dimexpr) {
        super(location);
        this.type = type;
        this.dimExpr = dimexpr;
    }

    public int getDim() {
        if (type instanceof ArrayTypeNode)
            return ((ArrayTypeNode) type).getDim();
        else
            return 0;
    }

    public ArrayList<ExprNode> getDimExpr(){
        return dimExpr;
    }

    public TypeNode getTypeNode() {
        return type;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "NEWExprNode{" +
                "type=" + type +
                ", dimExpr=" + dimExpr +
                '}';
    }
}
