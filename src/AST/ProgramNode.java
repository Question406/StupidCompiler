package AST;

import FrontEnd.ASTVisitor;
import IR.Operand.Variable;
import Utils.DebugOption;
import Utils.Location;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class ProgramNode extends ASTNode {
    ArrayList<DefNode> program_defs;
    public ProgramNode(Location location, ArrayList<DefNode> program_defs) {
        super(location);
        this.program_defs = program_defs;
    }

    public ArrayList<DefNode> getProgram_defs() {
        return program_defs;
    }

    public ArrayList<VarDefNode> getVarDers() {
        ArrayList<VarDefNode> res = null;
        for (var def : program_defs) {
            if (def instanceof VarDefNode) {
                if (res == null) res = new ArrayList<VarDefNode>();
                res.add((VarDefNode) def);
            }
        }
        return res;
    }

    @Override
    public void ShowInfo() {}

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "ProgramNode{" +
                "program_defs=" + program_defs +
                '}';
    }


    public void removeDef(ArrayList<ASTNode> toRm) {
        if (DebugOption.isDebugging) {
            for (var def : toRm) {
                //System.out.println("rm " + def);
                program_defs.remove(def);
            }
        } else
            program_defs.removeAll(toRm);
    }
}
