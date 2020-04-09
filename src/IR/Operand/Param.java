package IR.Operand;

import FrontEnd.Semantic.Type.Type;

public class Param extends Operand {
    Type type;
    String name;


    public Param(String name) {
        super(name);
    }
}
