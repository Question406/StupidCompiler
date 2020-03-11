package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

abstract public class DefNode extends ASTNode {

    DefNode(Location location) {
        super(location);
    }

    @Override
    public void ShowInfo() {};
}