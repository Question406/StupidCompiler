package IR.Operand;

import IR.IRVisitor;
import IR.Instruction.MoveInst;
import RISCV.PhyReg;
import RISCV.StackLoc;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class VirReg extends Register {
    int ssaID = -1;
    VirReg oldName = null;
    Map<Integer, VirReg> newNames = null;

    public boolean isPtr = false;
    public int ptrLevel = -1;

    // for RegAlloc
    public Set<VirReg> adjList = new HashSet<VirReg>();
    public int degree = 0;
    public PhyReg color = null;
    public Set<MoveInst> moveList = new HashSet<MoveInst>();
    public VirReg alias;
    public boolean addForSpill = false;
    public double spillCost = 0;
    public StackLoc stackLoc = null;

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
