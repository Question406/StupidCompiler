package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class ForStatNode extends StatNode {
    ASTNode for_init;
    ExprNode for_end, for_update;
    StatNode while_body;

    public ForStatNode(Location location, ASTNode for_init, ExprNode for_end, ExprNode for_update, StatNode while_body) {
        super(location);
        this.for_init = for_init;
        this.for_end = for_end;
        this.for_update = for_update;
        this.while_body = while_body;
    }

    public ExprNode getFor_end() {
        return for_end;
    }

    public ASTNode getFor_init() {
        return for_init;
    }

    public ExprNode getFor_update() {
        return for_update;
    }

    public StatNode getWhile_body() {
        return while_body;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "for (" + for_init.toString() + "," + for_end.toString() + "," + for_update.toString() + while_body.toString();
    }

}