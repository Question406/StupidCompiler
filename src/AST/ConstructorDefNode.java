package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Type.ConstructorType;
import FrontEnd.Semantic.Type.Type;
import Utils.Location;

import java.util.ArrayList;

public class ConstructorDefNode extends FuncDefNode {

    public ConstructorDefNode(Location location, String name, ArrayList<VarDefNode> paras, BlockStatNode funcbody) {
        super(location, new VoidTypeNode(location, "void"), name, paras, funcbody);
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public ConstructorType getType() throws Exception {
        ArrayList<Type> paramTypes = null;
        if (paras != null) {
            int n = 0;
            for (VarDefNode para : paras) {
                TypeNode paraType = para.getType();
                paramTypes.add(Type.getType(paraType));
            }
        }
        return new ConstructorType(funcName, paramTypes);
    }

    @Override
    public String toString() {
        return "constructor " + funcName;
    }
}
