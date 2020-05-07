package IR;

import IR.Instruction.*;
import IR.Operand.*;
import RISCV.Insts.LA;
import RISCV.Insts.LI;
import RISCV.Insts.LUI;
import RISCV.PhyReg;
import RISCV.StackLoc;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public class IRPrinter implements IRVisitor {
    boolean isGlobal;
    Map<String, Integer> nameMap;
    Map<VirReg, String>  varNameMap;
    int stringCnt = 0;
    Map<ConstString, String> constStringStringMap;
    Map<String, Integer> nameCntMap;

    Map<BasicBlock, String> BBnameMap;
    Map<String, Integer> BBnameCntMap;

    int indent;

    PrintStream outStream;

    public IRPrinter(PrintStream out) {
        nameMap = new HashMap<String, Integer>();
        varNameMap = new HashMap<VirReg, String>();
        nameCntMap = new HashMap<String, Integer>();
        constStringStringMap = new HashMap<ConstString, String>();

        BBnameCntMap = new HashMap<String, Integer>();
        BBnameMap = new HashMap<BasicBlock, String>();
        this.outStream = out;
    }

    private void printAnything(Object object) {
        String indentS = " ";
        for (int i = 0; i < indent; i++)
            indentS = indentS + "\t";
        outStream.print(indentS + object);
        //CommonFunc.printAnything(indentS + object);
    }

    @Override
    public void visit(Module node) {
        indent = 0;
        isGlobal = true;
        for (var string : node.getStringPool().entrySet())
            string.getValue().accept(this);

        for (var var : node.getGlobalVar().entrySet()) {
            var.getValue().accept(this);
            printAnything("\n" );
        }

        for (var var : node.getGlobalFuncMap().entrySet()) {
            if (Function.isBuiltIn(var.getValue())) continue;
            varNameMap.clear();
            nameMap.clear();
            nameCntMap.clear();
            BBnameCntMap.clear();
            BBnameMap.clear();
            isGlobal = true;
            var.getValue().accept(this);
        }
    }

    @Override
    public void visit(Function node) {
        printAnything("define " + ((node.isVoid) ? "void": "i32") + " @" + node.funcname + " ");
        if (node.thisPointer != null)
            node.thisPointer.accept(this);
        for (var arg : node.getArgs()) {
            arg.accept(this);
        }
        printAnything(" {\n");


//        node.ComputeDomBB();
//        node.ComputeIDomBB();
//        node.ComputeDomFrontier();


        var RPOBBs = node.getReversePostOrderBBs();
//        Set<BasicBlock> visited = new HashSet<BasicBlock>();
//        Stack<BasicBlock> BBs = new Stack<BasicBlock>();
        for (var BB : RPOBBs)
            BB.accept(this);
//        BBs.push(node.getEntryBB());
//        while (!BBs.empty()) {
//            var now = BBs.pop();
//            visited.add(now);
//            now.accept(this);
//            for (var bb : now.succBBs)
//                if (!visited.contains(bb)) {
//                    BBs.push(bb);
//                }
//        }
        //node.getEntryBB().accept(this);
        printAnything("}\n");
    }

    @Override
    public void visit(ConstString node) {
        String name;
        if (constStringStringMap.containsKey(node)) {
            name = constStringStringMap.get(node);
            printAnything(name);
        }
        else {
            name = "@constStr_" + stringCnt;
            stringCnt++;
            constStringStringMap.put(node, name);
            printAnything(name + " = " +node.getVal() + "\n");
        }
    }

    @Override
    public void visit(ConstInt node) {
        printAnything(node.getVal());
    }

    @Override
    public void visit(ConstNull node) {
        printAnything("null");
    }

    @Override
    public void visit(Variable node) {
        printAnything("@" + node.getName());
    }

    @Override
    public void visit(VirReg node) {
        printAnything("%" + getName(node));
    }

    @Override
    public void visit(AllocaInst node) {
        node.getReg().accept(this);
        printAnything(" = alloc ");
        node.getAllocSize().accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(BinOpInst node) {
        node.res.accept(this);
        printAnything(" = ");
        printAnything(" " + node.op + " ");
        node.lhs.accept(this);
        printAnything(" ");
        node.rhs.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(UnaryOpInst node) {
        node.res.accept(this);
        printAnything(" = ");
        printAnything(node.op + " ");
        node.src.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(BranchInst node) {
        printAnything("br ");
        node.cond.accept(this);
        printAnything(" " + BBgetName(node.getTrueBB()) + " " + BBgetName(node.getElseBB()) + " \n");
    }

    @Override
    public void visit(CmpInst node) {
        node.res.accept(this);
        printAnything(" = " + node.op + " ");
        node.lhs.accept(this);
        printAnything(" ");
        node.rhs.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(FuncCallInst node) {
        if (node.res != null) {
            node.res.accept(this);
            printAnything(" = ");
        }
        printAnything("call " + node.getCallTo().funcname + " ");
        if (node.thisPointer != null)
            node.thisPointer.accept(this);
        for (var para : node.params) {
            para.accept(this);
            printAnything(" ");
        }
        printAnything("\n");
    }

    @Override
    public void visit(JumpInst node) {
        printAnything("jump " + BBgetName(node.jumpTo) + "\n");
    }

    @Override
    public void visit(LoadInst node) {
        node.res.accept(this);
        printAnything(" = load ");
        node.from.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(MoveInst node) {
        node.moveTo.accept(this);
        printAnything(" = move ");
        node.moveFrom.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(RetInst node) {
        printAnything("ret ");
        if (node.getRetVal() != null)
            node.getRetVal().accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(StoreInst node) {
        printAnything("store ");
        node.storeTo.accept(this);
        printAnything(" ");
        node.res.accept(this);
        printAnything("\n");
    }

    @Override
    public void visit(BasicBlock node) {
        printAnything(BBgetName(node) + ":\n");

        printAnything("preds: ");
        node.predBBs.forEach(x -> printAnything(BBgetName(x) + " "));
        printAnything("\n");

        printAnything("succs: ");
        node.succBBs.forEach(x -> printAnything(BBgetName(x) + " "));
        printAnything("\n");

//        if (node.DomBBs != null){
//            printAnything("doms: ");
//            node.DomBBs.forEach(x -> printAnything(BBgetName(x) + " "));
//            printAnything("\n");
//        }
//
//        if (node.IDom != null) {
//            printAnything("idom: ");
//            printAnything(BBgetName(node.IDom) + " ");
//            printAnything("\n");
//        }
//
//        if (node.DomFros != null) {
//            printAnything("domfros: ");
//            node.DomFros.forEach(x -> printAnything(BBgetName(x) + " "));
//            printAnything("\n");
//        }

//        if (node.PostDomBBs != null){
//            printAnything("postdoms: ");
//            node.PostDomBBs.forEach(x -> printAnything(BBgetName(x) + " "));
//            printAnything("\n");
//        }
//
//        if (node.PostIDom != null) {
//            printAnything("postidom: ");
//            printAnything(BBgetName(node.PostIDom) + " ");
//            printAnything("\n");
//        }
//
//        if (node.PostDomFros != null) {
//            printAnything("postdomfros: ");
//            node.PostDomFros.forEach(x -> printAnything(BBgetName(x) + " "));
//            printAnything("\n");
//        }


        for (var inst = node.insthead; inst != null; inst = inst.next) {
            printAnything("\t\t");
            inst.accept(this);
        }
        printAnything("\n");
//        for (var bb : node.getSuccBBs())
//            bb.accept(this);
    }

    @Override
    public void visit(Operand node) {
        // fake visit
    }

    @Override
    public void visit(PhiInst node) {
        node.res.accept(this);
        printAnything(" = phi ");
        for (var from : node.from.entrySet()) {
            var fromBB = from.getKey();
            var fromOpr = from.getValue();
            printAnything(BBgetName(fromBB) + ": ");
            if (fromOpr == null)
                printAnything(" undef ");
//                printAnything(" 0 ");
            else
                fromOpr.accept(this);
            printAnything(" ");
        }
        printAnything("\n");
    }

    @Override
    public void visit(LA node) {

    }

    @Override
    public void visit(LUI node) {

    }

    @Override
    public void visit(PhyReg node) {

    }

    @Override
    public void visit(StackLoc node) {

    }

    @Override
    public void visit(LI node) {

    }

    private String BBgetName(BasicBlock asking) {
        String name = BBnameMap.get(asking);
        if (name == null) {
            String newName = CreateBBName(asking.name);
            BBnameMap.put(asking, newName);
            return newName;
        }
        else
            return name;
    }

    private String CreateBBName(String name) {
        name = "%" + name;
        if (BBnameCntMap.containsKey(name)) {
            int t = BBnameCntMap.get(name);
            BBnameCntMap.put(name, t + 1);
            return name + (t + 1);
        } else {
            BBnameCntMap.put(name, 1);
            return name + 1;
        }
    }

    private String getName(VirReg asking) {
        String name = varNameMap.get(asking);
        if (name == null) {
            if (asking.getOldName() != null) {
                name = getName(asking.getOldName()) + "." + asking.getSsaID();
            } else {
                name = CreateName(asking.getName());
            }
//            String newName = CreateName(asking.getName());
            varNameMap.put(asking, name);
            return name;
        }
        else
            return name;
    }

    private String CreateName(String originName) {
        if (nameCntMap.containsKey(originName)) {
            int t = nameCntMap.get(originName);
            nameCntMap.put(originName, t + 1);
            return originName + (t + 1);
        } else {
            nameCntMap.put(originName, 1);
            return originName + 1;
        }
    }
}
