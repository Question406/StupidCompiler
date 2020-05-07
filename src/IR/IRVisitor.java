package IR;

import IR.Instruction.*;
import IR.Operand.*;
import RISCV.Insts.LA;
import RISCV.Insts.LI;
import RISCV.Insts.LUI;
import RISCV.PhyReg;
import RISCV.StackLoc;

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

    void visit(LA node);

    void visit(LUI node);

    void visit(PhyReg node);

    void visit(StackLoc node);

    void visit(LI node);
}
