package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import java.util.ArrayList;

public class VarDefNode extends DefNode {
    TypeNode type;
    String ID;
    ExprNode varInit;

    public VarDefNode(Location location, TypeNode type, String ID, ExprNode varInit) {
        super(location);
        this.type = type;
        this.ID = ID;
        this.varInit = varInit;
    }

    public TypeNode getType() {
        return type;
    }

    public ExprNode getVarInit() {
        return varInit;
    }

    public String getID() {
        return ID;
    }

    @Override
    public void ShowInfo() {
        System.out.println("vardef " + type.name() + ID);
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "VarDefNode{" +
                "type=" + type +
                ", ID=" + ID +
                ", varInit=" + varInit +
                '}';
    }
}
