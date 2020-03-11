package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class ClassTypeNode extends TypeNode {

    public ClassTypeNode(Location location, String id) {
        super(location, id);
    }

    @Override
    public int allocsize() {
        return 8;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return id + "Type";
    }
}
