package IR.Operand;


import IR.IRVisitor;

public class ConstString extends Constant {
    String val;

    public ConstString(String val) {
        this.val = val;
    }

    public String getVal() {
        return val;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
