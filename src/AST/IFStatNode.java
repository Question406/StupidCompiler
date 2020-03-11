package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class IFStatNode extends StatNode {
    ExprNode cond;
    StatNode then_clause, else_clause;

    public IFStatNode(Location location, ExprNode cond, StatNode then_clause, StatNode else_clause) {
        super(location);
        this.cond = cond;
        this.then_clause = then_clause;
        this.else_clause = else_clause;
    }

    public ExprNode getCond() {
        return cond;
    }

    public StatNode getThen_clause() {
        return then_clause;
    }

    public StatNode getElse_clause() {
        return else_clause;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        if (else_clause != null)
            return "if (" + cond.toString() + then_clause.toString() + "\n else" + else_clause.toString();
        else
            return "if (" + cond.toString() + then_clause.toString();
    }
}
