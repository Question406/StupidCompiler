package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Scope.GlobalScope;
import FrontEnd.Semantic.Scope.LocalScope;
import FrontEnd.Semantic.Type.FunctionType;
import FrontEnd.Semantic.Type.Type;
import Utils.Exception.SemanticException;
import Utils.Location;

import java.util.ArrayList;

public class FuncDefNode extends DefNode {
    TypeNode functype;
    String funcName;
    ArrayList<VarDefNode> paras;
    BlockStatNode funcbody;

    // For Semantic
    LocalScope scope;

    public FuncDefNode(Location location, TypeNode functype, String funcName, ArrayList<VarDefNode> paras, BlockStatNode funcbody) {
        super(location);
        this.funcName = funcName;
        this.functype = functype;
        this.paras = paras;
        this.funcbody = funcbody;
    }

    @Override
    public void ShowInfo() {
        System.out.println("Func " + funcName + " paras: " + paras + " funcbody: " + funcbody);
    }

    public TypeNode getFunctype() {
        return functype;
    }

    public String getFuncName() {
        return funcName;
    }

    public BlockStatNode getFuncbody() {
        return funcbody;
    }

    public ArrayList<VarDefNode> getParas() {
        return paras;
    }

    public void setScope(LocalScope scope) {
        this.scope = scope;
    }

    @Override
    public LocalScope getScope() {
        return scope;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return functype.toString() + funcName + "{" + funcbody.toString() + "}";
    }

    public FunctionType getType() throws Exception {
        Type returnType = Type.getType(functype);
        ArrayList<Type> paramTypes = null;
        if (paras != null) {
            paramTypes = new ArrayList<Type>();
            int n = 0;
            for (VarDefNode para : paras) {
                TypeNode paraType = para.getType();
                paramTypes.add(Type.getType(paraType));
            }
        }

        return new FunctionType(funcName, returnType, paramTypes);
    }
}
