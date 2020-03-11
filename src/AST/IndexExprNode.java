package AST;

import FrontEnd.ASTVisitor;
import Utils.Location;

public class IndexExprNode extends ExprNode {
    ExprNode array, index; // in a[123 + 44], array-> "a", index-> "123+44" in AST
    public IndexExprNode(Location location, ExprNode array, ExprNode index) {
        super(location);
        this.array = array;
        this.index = index;
    }

    public void ShowInfo(){
        System.out.println("IndexExprNode " + array + " : " + index);
    }

    public ExprNode getArray() {
        return array;
    }

    public ExprNode getIndex() {
        return index;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "indexExpr: " + array.toString() + "[" + index.toString() + "]";
    }
}
