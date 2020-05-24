package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class VarTypeNode extends TypeNode {
    public VarTypeNode(Location location, String id) {
        super(location, id);
    }

    @Override
    public int allocsize() {
        switch (id) {
            case "int":
                return 8;
            case "bool":
                return 1;
            case "string":
                return 8;
//            default:
//                exit(1);
        }
        return 0;
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
