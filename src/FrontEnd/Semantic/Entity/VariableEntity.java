package FrontEnd.Semantic.Entity;

import AST.ExprNode;
import AST.TypeNode;
import AST.VarDefNode;
import IR.Operand.Operand;

public class VariableEntity extends Entity {
    ExprNode initExpr;
    int offset;
    boolean isClassMember;

    Operand irVal;

    public VariableEntity(TypeNode type, String name, ExprNode initExpr) {
        super(type, name);
        this.initExpr = initExpr;
        isClassMember = false;
    }

    public VariableEntity(VarDefNode def) {
        super(def.getType(), def.getID());
        initExpr = def.getVarInit();
    }


    public void setIrVal(Operand irVal) {
        this.irVal = irVal;
    }

    public Operand getDefaultIrVal() {
        return irVal;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getOffset() {
        return offset;
    }

    public void setClassMember(boolean classMember) {
        isClassMember = classMember;
    }

    public boolean isClassMember() {
        return isClassMember;
    }
}
