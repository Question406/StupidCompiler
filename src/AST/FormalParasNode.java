package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

import java.util.ArrayList;

public class FormalParasNode extends ASTNode {
    ArrayList<VarDefNode> paraList;

    public FormalParasNode(Location location, ArrayList<VarDefNode> paraList) {
        super(location);
        this.paraList = paraList;
    }

    public ArrayList<VarDefNode> getParaList() {
        return paraList;
    }

    @Override
    public void ShowInfo() {}

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "paras: " + paraList.toString();
    }
}
