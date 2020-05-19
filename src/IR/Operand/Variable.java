package IR.Operand;

import FrontEnd.Semantic.Type.Type;
import IR.Function;
import IR.IRVisitor;
import IR.Instruction.Instruction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Variable extends Operand {
    Type type;

    // used to localize global variable
    public ArrayList<Function> usedFuncs = new ArrayList<>();
    public Map<Function, Instruction> funcUsedInst = new HashMap<>();
    public ArrayList<Instruction> initInsts = new ArrayList<>();

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
