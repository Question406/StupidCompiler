package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class AssignExprNode extends ExprNode {
    ExprNode lhs, rhs;

    public AssignExprNode(Location location, ExprNode lhs, ExprNode rhs) {
        super(location);
        this.lhs = lhs;
        this.rhs = rhs;
    }

    public ExprNode getLhs() {
        return lhs;
    }

    public ExprNode getRhs() {
        return rhs;
    }

    @Override
    public void ShowInfo() {
        lhs.ShowInfo();
        System.out.println(" = ");
        rhs.ShowInfo();
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "AssignExpr: " + lhs.toString() + "=" + rhs.toString();
    }


}
