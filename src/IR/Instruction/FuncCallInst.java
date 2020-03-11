package IR.Instruction;

import IR.BasicBlock;
import IR.Function;
import IR.IRVisitor;
import IR.Operand.Operand;

import java.util.ArrayList;

public class FuncCallInst extends Instruction {
    public Function callTo;
    public ArrayList<Operand> params;
    public Operand thisPointer;
    public Operand res;


    public FuncCallInst(BasicBlock BB, Function callTo, ArrayList<Operand> params, Operand res) {
        super(BB);
        this.callTo = callTo;
        this.params = params;
        this.res = res;
    }

    public void addParam(Operand param) {
        params.add(param);
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
