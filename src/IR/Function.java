package IR;

import FrontEnd.Semantic.Type.FunctionType;
import IR.Instruction.JumpInst;
import IR.Instruction.MoveInst;
import IR.Instruction.RetInst;
import IR.Operand.Operand;
import IR.Operand.Pointer;
import IR.Operand.VirReg;

import java.io.PipedOutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class Function {
    String funcname;
    public ArrayList<VirReg> args;
    public VirReg thisPointer;
    public boolean isVoid;

    public BasicBlock entryBB;
    public BasicBlock exitBB;

    ArrayList<RetInst> retInsts;

    ArrayList<BasicBlock> reversePostOrderBBs;


    // FIXME: may be a temporary one, for IRprinter now
    public ArrayList<BasicBlock> BBs;

    public Function(String funcname) {
        entryBB = new BasicBlock(this,  funcname + ".entryBB");
        exitBB = new BasicBlock(this, funcname + ".exitBB");
        args = new ArrayList<VirReg>();
        this.funcname = funcname;
        retInsts = new ArrayList<RetInst>();

        BBs = new ArrayList<BasicBlock>();
        reversePostOrderBBs = null;
    }

    public ArrayList<VirReg> getArgs() {
        return args;
    }

    public void addArg(VirReg arg) {
        args.add(arg);
    }

    public BasicBlock getEntryBB() {
        return entryBB;
    }

    public void setThisPointer(VirReg thisPointer) {
        this.thisPointer = thisPointer;
    }

    public VirReg getThisPointer() {
        return thisPointer;
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    public void addRetInst(RetInst inst) {
        this.retInsts.add(inst);
    }

    public void setExitBB(BasicBlock exitBB) {
        this.exitBB = exitBB;
    }

    public String getFuncname() {
        return funcname;
    }

    public void PostOrderDFS(Set<BasicBlock> visited, BasicBlock curBB) {
        visited.add(curBB);
        for (var bb : curBB.succBBs)
            if (!visited.contains(bb)) {
                PostOrderDFS(visited, bb);
            }
        reversePostOrderBBs.add(curBB);
    }

    public ArrayList<BasicBlock> getReversePostOrderBBs() {
        if (reversePostOrderBBs == null)
            CalcReversePostOrderBBs();
        return reversePostOrderBBs;
    }

    public void CalcReversePostOrderBBs(){
        reversePostOrderBBs = new ArrayList<BasicBlock>();
        Set<BasicBlock> visited = new HashSet<BasicBlock>();
        PostOrderDFS(visited, entryBB);
        for (int i = 0; i < reversePostOrderBBs.size(); i++)
            reversePostOrderBBs.get(i).RPOnum = i;
        Collections.reverse(reversePostOrderBBs);
    }

    public void NaiveRMUnreachableBB(){
        boolean changed = true;
        while (changed) {
            changed = false;

            CalcReversePostOrderBBs();
            ArrayList<BasicBlock> toRM = new ArrayList<BasicBlock>();
            for (var bb : BBs)
                if (!reversePostOrderBBs.contains(bb)) {
                    bb.RMSelf();
                    toRM.add(bb);
                    changed = true;
                }
            BBs.removeAll(toRM);
        }
    }


    public void ResolveRetInst() {
        if (retInsts.size() == 1)
            this.exitBB = retInsts.get(0).curBB;
        else {
            VirReg retVal = (isVoid) ? null : new VirReg("mergedretVal");
            // have multiple return stat
            for (var retInst : retInsts) {
                BasicBlock atBB = retInst.curBB;
                atBB.removeRetInst();
                if (retInst.getRetVal() != null) {
                    atBB.addInst(new MoveInst(atBB, retVal, retInst.getRetVal()));
                }
                atBB.endBB(new JumpInst(atBB, exitBB));
            }
            exitBB.endBB(new RetInst(exitBB, retVal));
        }
    }

    public static boolean isBuiltIn(Function func) {
        if (func.funcname.equals("string.add")) return true;
        if (func.funcname.equals("getString")) return true;
        if (func.funcname.equals("string.substring")) return true;
        if (func.funcname.equals("string.ord")) return true;
        if (func.funcname.equals("getInt")) return true;
        if (func.funcname.equals("print")) return true;
        if (func.funcname.equals("println")) return true;
        if (func.funcname.equals("string.parseInt")) return true;
        if (func.funcname.equals("printInt")) return true;
        if (func.funcname.equals("printlnInt")) return true;
        if (func.funcname.equals("toString")) return true;
        if (func.funcname.equals("string.length")) return true;
        return func.funcname.equals("array.size");
    }


}
