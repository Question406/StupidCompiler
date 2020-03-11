package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class WhileStatNode extends StatNode {
    ExprNode cond;
    StatNode while_body;

    public WhileStatNode(Location location, ExprNode cond, StatNode while_body) {
        super(location);
        this.cond = cond;
        this.while_body = while_body;
    }

    public StatNode getWhile_body() {
        return while_body;
    }

    public ExprNode getCond() {
        return cond;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "WhileStatNode{" +
                "cond=" + cond +
                ", while_body=" + while_body +
                '}';
    }
}
