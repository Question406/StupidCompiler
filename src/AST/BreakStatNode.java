package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class BreakStatNode extends StatNode {
    public BreakStatNode(Location location) {
        super(location);
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "break";
    }
}