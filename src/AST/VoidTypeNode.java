package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class VoidTypeNode extends TypeNode {

    public VoidTypeNode(Location location, String id) {
        super(location, id);
    }

    @Override
    public int allocsize() {
        return 0;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "voidType";
    }
}
