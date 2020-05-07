package IR.Operand;

import IR.IRVisitor;
import IR.Instruction.Instruction;

import java.util.HashSet;
import java.util.Set;

public class Operand {
    public String name;
    public Instruction defInst;
    public Set<Instruction> usedInstructions = new HashSet<Instruction>();

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
