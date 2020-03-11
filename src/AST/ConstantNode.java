package AST;

import Utils.Location;

abstract public class ConstantNode extends AtomExprNode {

    public ConstantNode(Location location) {
        super(location);
    }
}
