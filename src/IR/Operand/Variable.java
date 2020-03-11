package IR.Operand;

import FrontEnd.Semantic.Type.Type;
import IR.IRVisitor;

public class Variable extends Operand {
    Type type;
    String name;

    public Variable(Type type, String name) {
        this.type = type;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public Type getType() {
        return type;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
