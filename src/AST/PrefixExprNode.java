package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;
import Utils.UnaryOperator;

public class PrefixExprNode extends ExprNode {
    UnaryOperator op;
    ExprNode selfExpr;

    public PrefixExprNode(Location location, UnaryOperator op, ExprNode selfExpr) {
        super(location);
        this.op = op;
        this.selfExpr = selfExpr;
    }

    public UnaryOperator getOp(){
        return op;
    }

    public ExprNode getSubExpr(){
        return selfExpr;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "PrefixExprNode{" +
                "op=" + op +
                ", selfExpr=" + selfExpr +
                '}';
    }
}
