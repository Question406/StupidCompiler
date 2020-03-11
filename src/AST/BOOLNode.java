package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class BOOLNode extends ConstantNode {
    String bool_val;

    public BOOLNode(Location location, String text) {
        super(location);
        this.bool_val = text;
    }

    public String getBool_val() {
        return bool_val;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return bool_val;
    }
}
