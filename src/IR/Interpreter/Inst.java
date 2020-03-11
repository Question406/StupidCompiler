package IR.Interpreter;

import Utils.Exception.SemanticException;

import java.util.List;

class Inst {
    Interpreter interpreter;
    Func func;

    int line;
    String text;

    String kind;
    String dest;
    String op;
    String src1;
    String src2;

    List<String> args;

    public Inst(Interpreter interpreter,Func func) {
        this.interpreter = interpreter;
        this.func = func;
    }
    void run() {
        if (++interpreter.instCnt >= interpreter.MAXINSTLIMIT)
            throw new RuntimeException("inst limit exceeded");
        switch (kind) {
            case "load" :
                int addr = readSrc(src1);

                return;
            case "store":
                return;
            case "alloc":
                return;
            case "ret":
                return;
            case "br" :
                return;
            case "jump":
                return;
            case "call":
                return;
            case "move":
                return;

            case "add":
                return;
            case "sub":
                return;
            case "mul":
                return;
            case "div":
                return;
            case "mod":
                return;
            case "shl":
                return;
            case "shr":
                return;
            case "le":
                return;
            case "ge":
                return;
            case "gt":
                return;
            case "lt":
                return;
            case "and":
                return;
            case "or":
                return;
            case "xor":
                return;
            case "not":
                return;
        }
    }

    void writeReg(String name, int towrite) {
        if (!name.startsWith("@") && !name.startsWith("%"))
            throw new RuntimeException("not a register");
        if (name.startsWith("@")) {
            Reg reg = interpreter.globalRegs.get(name);
            if (reg == null) {
                reg = new Reg();
                interpreter.globalRegs.put(name, reg);
            }
            reg.val = towrite;
        } else {
            Reg reg = func.regMap.get(name);
            if (reg == null) {
                reg = new Reg();
                func.regMap.put(name, reg);
            }
            reg.val = towrite;
        }
    }

    int readSrc(String name) {
        if (name.startsWith("%")) {
            Reg reg = func.regMap.get(name);
            if (reg == null)
                throw new SemanticException("cannot resolve variable");
            else
                return reg.val;
        } else if (name.startsWith("@")) {
            Reg reg = interpreter.globalRegs.get(name);
            if (reg == null)
                throw new SemanticException("cannot resolve global variable");
            else
                return reg.val;
        } else
            return Integer.parseInt(name);
    }
}
