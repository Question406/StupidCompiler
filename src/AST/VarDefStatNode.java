package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import java.util.ArrayList;

public class VarDefStatNode extends StatNode {
    VarDefsNode varDefs;

    public VarDefStatNode(Location location, VarDefsNode varDef) {
        super(location);
        this.varDefs = varDef;
    }

    public VarDefsNode getVarDefs() {
        return varDefs;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "VarDefStatNode{" +
                "varDef=" + varDefs +
                '}';
    }
}
