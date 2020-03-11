package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Scope.LocalScope;
import Utils.Location;

abstract public class StatNode extends ASTNode {
    LocalScope scope;

    StatNode(Location location) {
        super(location);
    }

    public void setScope(LocalScope scope) {
        this.scope = scope;
    }

    @Override
    public void ShowInfo() {
        System.out.println("a stat node");
    }

}
