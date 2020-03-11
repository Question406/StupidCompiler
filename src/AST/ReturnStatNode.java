package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class ReturnStatNode extends StatNode {
    ExprNode return_expr;

    public ReturnStatNode(Location location, ExprNode expr) {
        super(location);
        this.return_expr = expr;
    }

    public ExprNode getReturn_expr() {
        return return_expr;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "ReturnStatNode{" +
                "return_expr=" + return_expr +
                '}';
    }
}
