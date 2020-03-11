package AST;


import FrontEnd.ASTVisitor;
import Utils.Location;

public class ArrayTypeNode extends TypeNode {
    int dim;

    public ArrayTypeNode(Location location, String id, int dim) {
        super(location, id);
        this.dim = dim;
    }


    public int getDim() {
        return dim;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    public TypeNode getBaseType() {
        return new VarTypeNode(location, id);
    }

    @Override
    public String toString() {
        return "ArrayTypeNode{" +
                "id='" + id + '\'' +
                '}';
    }

    @Override
    public int allocsize() {
        return dim;
    }
}
