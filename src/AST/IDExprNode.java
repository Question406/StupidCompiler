package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Entity.VariableEntity;
import Utils.Location;

public class IDExprNode extends ExprNode {
    String name;

    VariableEntity entity;

    public IDExprNode(Location location, String name) {
        super(location);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return name;
    }

    public void setEntity(VariableEntity entity) {
        this.entity = entity;
    }

    public VariableEntity getEntity() {
        return entity;
    }
}
