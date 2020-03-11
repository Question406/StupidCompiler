package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;
import Utils.UnaryOperator;

public class PostFixExprNode extends ExprNode {
    ExprNode selfExpr;
    UnaryOperator op;

    public PostFixExprNode(Location location, ExprNode selfExpr, UnaryOperator op) {
        super(location);
        this.selfExpr = selfExpr;
        this.op = op;
    }

    public ExprNode getExpr(){
        return selfExpr;
    }

    public UnaryOperator getOp(){
        return op;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "PostFixExprNode{" +
                "selfExpr=" + selfExpr +
                ", op=" + op +
                '}';
    }
}
