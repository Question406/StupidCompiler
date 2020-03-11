package IR.Interpreter;

class Reg {
    int val;

    // only for string
    int len;

    Reg() {

    }

    void setReg(int val) {
        this.val = val;
    }

    int readReg() {
        return val;
    }
}
