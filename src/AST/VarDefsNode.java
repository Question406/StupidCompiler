package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import java.util.ArrayList;

public class VarDefsNode extends DefNode {
    ArrayList<VarDefNode> varDefs;

    public VarDefsNode(Location location, ArrayList<VarDefNode> varDefs) {
        super(location);
        this.varDefs = varDefs;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    public ArrayList<VarDefNode> getVarDefs() {
        return varDefs;
    }

    @Override
    public String toString() {
        return null;
    }
}
