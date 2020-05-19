package IR.Operand;

public class Pointer extends VirReg {
    public VirReg pointTO;
    public int size;

    public Pointer(String name, int size) {
        super(name);
        this.size = size;
    }

    @Override
    public Operand CopySelf() {
        return new Pointer("_" + name, this.size);
    }
}
