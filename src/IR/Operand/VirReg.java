package IR.Operand;

import IR.IRVisitor;

public class VirReg extends Operand {
    String name;
    int ssaID;
    Pointer addr;

    public VirReg(String name) {
        this.name = name;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public String getName() {
        return name;
    }

    public Pointer getAddr() {
        return addr;
    }
}
