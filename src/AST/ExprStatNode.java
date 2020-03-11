package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class ExprStatNode extends StatNode {
    ExprNode expr;
    public ExprStatNode(Location location, ExprNode expr) {
        super(location);
        this.expr = expr;
    }

    public ExprNode getExpr() {
        return expr;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return expr.toString() + ";";
    }
}
