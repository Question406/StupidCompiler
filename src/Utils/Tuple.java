package Utils;

import AST.TypeNode;
import FrontEnd.Semantic.Type.Type;

public class Tuple {
    TypeNode first;
    String second;
    public Tuple(TypeNode first, String second) {
        this.first = first;
        this.second = second;
    }

    // for classType
    public TypeNode getType() {
        return first;
    }

    public String getName() {
        return second;
    }
}
