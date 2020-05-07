package RISCV;

import IR.IRVisitor;
import IR.Operand.Register;

public class PhyReg extends Register {
    public PhyReg(String name) {
        super(name);
    }

    @Override
    public String toString() {
        return name;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
