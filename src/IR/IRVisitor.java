package IR;

import IR.Instruction.*;
import IR.Operand.*;

public interface IRVisitor {
    void visit(Module node);

    void visit(Function node);

    void visit(ConstString node);

    void visit(ConstInt node);

    void visit(ConstNull node);

    void visit(Variable node);

    void visit(VirReg node);

    void visit(AllocaInst node);

    void visit(BinOpInst node);

    void visit(UnaryOpInst node);

    void visit(BranchInst node);

    void visit(CmpInst node);

    void visit(FuncCallInst node);

    void visit(JumpInst node);

    void visit(LoadInst node);

    void visit(MoveInst node);

    void visit(RetInst node);

    void visit(StoreInst node);

    void visit(BasicBlock node);

    void visit(Operand node);

    void visit(PhiInst node);
}
