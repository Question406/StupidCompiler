package AST;

import Utils.Location;

abstract public class AtomExprNode extends ExprNode {
    public AtomExprNode(Location location) {
        super(location);
    }
}
