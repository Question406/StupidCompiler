package IR.Operand;

public class Pointer extends VirReg {
    VirReg pointTO;

    public Pointer(String name, VirReg pointTO) {
        super(name);
        this.pointTO = pointTO;
    }

    public Pointer(String name) {
        super(name);
    }
}
