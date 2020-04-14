package IR.Operand;

import IR.IRVisitor;

import java.util.HashMap;
import java.util.Map;

public class VirReg extends Operand {
    int ssaID = -1;
    VirReg oldName = null;
    Map<Integer, VirReg> newNames = null;

    public VirReg(String name) {
        super(name);
    }

    public VirReg(String name, int ssaID, VirReg oldName) {
        super(name);
        this.ssaID = ssaID;
        this.oldName = oldName;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public String getName() {
        return name;
    }

    public VirReg getSSANewName(int newNameID) {
        assert ssaID == -1; // assert is the original name
        if (newNames == null)
            newNames = new HashMap<Integer, VirReg>();
        VirReg name = newNames.get(newNameID);
        if (name == null) {
            name = new VirReg(this.name, newNameID, this);
            newNames.put(newNameID, name);
        }
        return name;
    }

    public VirReg getOldName() {
        return oldName;
    }

    @Override
    public Operand CopySelf() {
        return new VirReg("_" + name);
    }

    public int getSsaID() {
        return ssaID;
    }

    public String toString() {
        return (ssaID != -1) ? (name + "." + ssaID) : name;
    }
}
