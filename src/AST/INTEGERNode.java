package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import static java.lang.Integer.valueOf;

public class INTEGERNode extends ConstantNode {
    int value;

    public INTEGERNode (Location location, String text) {
        super(location);
        this.value = valueOf(text);
    }

    public int getValue() {
        return value;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "INTEGERNode{" +
                "value=" + value +
                '}';
    }
}
