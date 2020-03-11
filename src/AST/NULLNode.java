package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class NULLNode extends ConstantNode {
    public NULLNode(Location location) {
        super(location);
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "null";
    }
}
