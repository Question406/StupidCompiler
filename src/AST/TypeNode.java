package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

abstract public class TypeNode extends ASTNode {
    String id;

    public TypeNode(Location location, String id) {
        super(location);
        this.id = id;
    }

    public String name(){
        return id;
    }

    public void ShowInfo(){
        System.out.println("TypeNode at " + location + " id: " + id);
    }

    abstract public int allocsize();
}
