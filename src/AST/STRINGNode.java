package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class STRINGNode extends ConstantNode {
    String text;

    public STRINGNode(Location location, String text) {
        super(location);
        this.text = text;
    }

    public String getValue(){
        return text;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "STRINGNode{" +
                "text='" + text + '\'' +
                '}';
    }
}
