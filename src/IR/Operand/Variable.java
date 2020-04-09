package IR.Operand;

import FrontEnd.Semantic.Type.Type;
import IR.IRVisitor;

public class Variable extends Operand {
    Type type;

    public Variable(Type type, String name) {
        super(name);
        this.type = type;
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


    @Override
    public Operand CopySelf() {
        return new Variable(type, "_" + name);
    }
}
