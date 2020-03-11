package IR.Interpreter;

import IR.BasicBlock;

import java.util.ArrayList;

class BBlock {
    Interpreter interpreter;
    String name;
    ArrayList<Inst> insts;

    BBlock() {
    }

    BBlock(String name, Interpreter interpreter) {
        this.name = name;
        this.insts = new ArrayList<Inst>();
        this.interpreter = interpreter;
    }

    void addInst(Inst inst) {
        insts.add(inst);
    }
}
