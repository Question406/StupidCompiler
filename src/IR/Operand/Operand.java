package IR.Operand;

import IR.IRVisitor;

public class Operand {
    String name;

    public Operand(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public Operand CopySelf() {
        return null;
    }
}
