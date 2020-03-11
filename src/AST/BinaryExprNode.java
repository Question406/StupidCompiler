package AST;

import FrontEnd.ASTVisitor;
import Utils.BinaryOperator;
import Utils.Location;

public class BinaryExprNode extends ExprNode {
    ExprNode lhs, rhs;
    BinaryOperator op;

    public BinaryExprNode(Location location, BinaryOperator op, ExprNode lhs, ExprNode rhs) {
        super(location);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    public BinaryOperator getOp() {
        return op;
    }

    public ExprNode getLHS() {
        return lhs;
    }

    public ExprNode getRHS() {
        return rhs;
    }

    @Override
    public void ShowInfo() {
        lhs.ShowInfo();
        rhs.ShowInfo();
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return lhs.toString() + op.toString() + rhs.toString();
    }


}
