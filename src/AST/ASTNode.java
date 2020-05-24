package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Scope.Scope;
import Utils.Location;

abstract public class ASTNode {
    Location location;
    Scope scope;

    public ASTNode(Location location) { this.location = location; }

    public void setScope(Scope scope) {
        this.scope = scope;
    }

    public Scope getScope() {
        return scope;
    }

    public Location getLocation() {
        return location;
    }

    public abstract void ShowInfo();

    public abstract void accept(ASTVisitor visitor) throws Exception;

    abstract public String toString();

    public int hashCode() {
        return toString().hashCode();
    }

    public boolean equals(Object other) {
        if (other instanceof ASTNode)
            return toString().equals(other.toString());
        else
            return false;
    }

}
