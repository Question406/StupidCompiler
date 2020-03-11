package IR.Operand;


import IR.IRVisitor;

public class ConstInt extends Constant {
    int val;

    public ConstInt(int val) {
        this.val = val;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public int getVal() {
        return val;
    }
}
