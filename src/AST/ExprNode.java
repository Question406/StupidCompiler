package AST;

import FrontEnd.Semantic.Type.Type;
import IR.BasicBlock;
import IR.Operand.Addr;
import IR.Operand.Operand;
import Utils.Location;

abstract public class ExprNode extends ASTNode {
    Type type;
    boolean isLvalue;

    Operand operand;
    Addr addr;
    BasicBlock trueBB;
    BasicBlock elseBB;

    public ExprNode(Location location) {
        super(location);
    }

    @ Override
    public void ShowInfo() {
        System.out.println("ExprNode: " + " whose type : " + type);
    }

    public Type getType() {
        return type;
    };

    public void setType(Type type) {
        this.type = type;
    };

    // for assign expr check
    public boolean isLvalue(){
        return isLvalue;
    }
    public void setLvalue(boolean lvalue) {
        isLvalue = lvalue;
    };

    public void setTrueBB(BasicBlock trueBB) {
        this.trueBB = trueBB;
    }

    public void setElseBB(BasicBlock elseBB) {
        this.elseBB = elseBB;
    }

    public void setOperand(Operand operand) {
        this.operand = operand;
    }

    public Operand getOperand() {
        return operand;
    }

    public void setAddr(Addr addr) {
        this.addr = addr;
    }

    public Addr getAddr() {
        return addr;
    }

    public BasicBlock getTrueBB() {
        return trueBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }
}
