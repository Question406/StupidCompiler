package AST;

import Utils.Location;

import java.util.ArrayList;

public class ConstructorTypeNode extends FunctionTypeNode {
    public ConstructorTypeNode(Location location, String id, ArrayList<TypeNode> paramList) {
        super(location, id, null, paramList);
    }

    public ConstructorTypeNode(FuncDefNode method) {
        super(method);
    }
}
