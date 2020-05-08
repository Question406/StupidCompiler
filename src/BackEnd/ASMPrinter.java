package BackEnd;

import IR.BasicBlock;
import IR.Function;
import IR.IRVisitor;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.*;
import RISCV.Insts.LA;
import RISCV.Insts.LI;
import RISCV.Insts.LUI;
import RISCV.PhyReg;
import RISCV.StackLoc;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public class ASMPrinter implements IRVisitor {

    Map<BasicBlock, String> BBnameMap;
    Map<String, Integer> BBnameCntMap;

    public ASMPrinter(PrintStream out) {
        this.out = out;
        indent = "";
        BBnameMap = new HashMap<BasicBlock, String>();
        BBnameCntMap = new HashMap<String, Integer>();
    }

    public void runFunction(Function func) {
        indentAdd();
        this.visit(func);
    }

    PrintStream out;
    String indent;

    private void indentAdd() {
        indent = indent + "    ";
    }

    private void indentSub() {
        indent = indent.substring(4);
    }

    private void println(Object anything) {
        out.println(indent + anything);
    }

    private void print(Object anything) {
        out.print(indent + anything);
    }

    private void printInline(Object anything) { out.print(anything); }

    private void printlnInline(Object anything) { out.println(anything); }
    @Override
    public void visit(Module node) {
        indentAdd();
        println(".text");
        for (var func : node.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            func.accept(this);
        }

        println(".section\t.sdata,\"aw\",@progbits");
        node.getGlobalVar().forEach((s,globalVar) ->
                globalVar.accept(this)
        );

        node.getStringPool().forEach((s, globalStr) ->
            globalStr.accept(this)
        );
    }

    @Override
    public void visit(Function node) {
        var name = node.getFuncname();
        if (name.equals("__init"))
            name = "main";
        println(".globl\t" + name + "\t\t\t\t\t\t # func begin ");
        println(".p2align\t2");
        println(".type\t" + name + ",@function");
        indentSub();
        println(name + ":");
        node.getReversePostOrderBBs().forEach(bb->
                bb.accept(this)
        );
        println("\t\t\t\t\t\t\t\t # func end");
        indentAdd();
    }

    @Override
    public void visit(ConstString node) {
        println(".globl\t" + node.getName() + "\t\t\t\t\t#@" + node.getName());
        indentSub();
        println(node.getName() + ":");
        indentAdd();
        print(".asciz  " + node.getVal());
        println("");
    }

    @Override
    public void visit(ConstInt node) {
        print(node.getVal());
    }

    @Override
    public void visit(ConstNull node) {}

    @Override
    public void visit(Variable node) {
        println(".globl\t" + node.getName() + "\t\t\t\t\t#@" + node.getName());
        println(".p2align\t2");
        indentSub();
        println(node.getName() + ":");
        indentAdd();
        println(".word\t0");
        println(" ");
    }

    @Override
    public void visit(VirReg node) {
//        print(node.color + " ");
        if (node.color != null)
            printInline(node.color);
        else
            printInline(node);
    }

    @Override
    public void visit(AllocaInst node) {
        println("call malloc");
    }

    @Override
    public void visit(BinOpInst node) {
        print(node.riscvop + " ");
        node.res.accept(this);
        printInline(",");
        node.lhs.accept(this);
        printInline(",");
        node.rhs.accept(this);
        printlnInline("");
    }

    @Override
    public void visit(UnaryOpInst node) {}

    @Override
    public void visit(BranchInst node) {
        if (node.condInst != null) {
            var condInst = node.condInst;
            switch (node.condInst.op) {
                case EQ:
                    print("beq");
                    break;
                case NEQ:
                    print("bne");
                    break;
                case LTH:
                    print("blt");
                    break;
                case LEQ:
                    print("ble");
                    break;
                case GTH:
                    print("bgt");
                    break;
                case REQ:
                    print("bge");
                    break;
            }
            printInline("\t");
            condInst.lhs.accept(this);
            printInline(",");
            condInst.rhs.accept(this);
            printlnInline(",\t" + BBgetName(node.trueBB));
        } else {
            print("bne\t");
            node.cond.accept(this);
            printlnInline(", zero, " + BBgetName(node.trueBB));
        }
    }

    @Override
    public void visit(CmpInst node) {
        print(node.riscvop + " ");
        node.res.accept(this);
        printInline(",");
        node.lhs.accept(this);
        printInline(",");
        node.rhs.accept(this);
        printlnInline(" ");
    }

    private String getRealBuiltInName(Function func) {
        switch (func.getFuncname()) {
            case "string.length" : return "stringLength";
            case "string.substring" : return "_stringSubstring";
            case "string.parseInt" : return "_stringParseInt";
            case "string.ord" : return "_stringOrd";
            case "array.size" : return "_arraySize";
            case "string.add" : return "_stringAdd";
            case "string.eq" : return "_stringEqual";
            case "string.neq" : return "_stringNotEqual";
            case "string.gth" : return "_stringGreater";
            case "string.geq" : return "_stringGreaterEqual";
            case "string.lth" : return "_stringLess";
            case "string.leq" : return "_stringLessEqual";
            case "toString" : return "toString";
            case "print" : return "print";
            case "println" : return "println";
            case "printInt" : return "printInt";
            case "printlnInt" : return "printlnInt";
            case "getInt" : return "getInt";
            case "getString" : return "getString";
            default:
                System.err.println(func.getFuncname());
                throw  new RuntimeException("damn");
        }
    }

    @Override
    public void visit(FuncCallInst node) {
        if (Function.isBuiltIn(node.getCallTo()))
            println("call\t" + getRealBuiltInName(node.getCallTo()));
        else
            println("call\t" + node.getCallTo().getFuncname());
    }

    @Override
    public void visit(JumpInst node) {
        println("j\t"+BBgetName(node.jumpTo));
    }

    @Override
    public void visit(LoadInst node) {
        print("lw ");
        node.res.accept(this);
        printInline(", ");
        if (node.from instanceof StackLoc) {
            node.from.accept(this);
            printlnInline(" ");
        }
        else {
            printInline("0(");
            node.from.accept(this);
            printlnInline(")");
        }

    }

    @Override
    public void visit(MoveInst node) {
        print("mv\t");
        node.moveTo.accept(this);
        printInline(",");
        node.moveFrom.accept(this);
        printlnInline(" ");
    }

    @Override
    public void visit(RetInst node) {
        println("ret");
    }

    @Override
    public void visit(StoreInst node) {
        print("sw ");
        node.res.accept(this);
        if (node.helper != null) { // global
            printInline(", %lo(" + node.storeTo.name + ")(" + node.helper.name);
//            node.helper.accept(this);
            printlnInline(")");
        } else {
            if (node.storeTo instanceof StackLoc) {
                printInline(", ");
                node.storeTo.accept(this);
                printlnInline(" ");
            } else {
                printInline(",0(");
                node.storeTo.accept(this);
//                printInline(node.storeTo.name);
                printlnInline(")");
            }
        }
    }

    @Override
    public void visit(BasicBlock node) {
        println((BBgetName(node) + ":"));
        indentAdd();
        for (var inst = node.insthead; inst != null; inst = inst.next) {
            inst.accept(this);
        }
        indentSub();
    }

    @Override
    public void visit(Operand node) {

    }

    @Override
    public void visit(PhiInst node) {}

    @Override
    public void visit(LA node) {
        print("la ");
        node.res.accept(this);
        printInline(",");
        printInline(node.from.getName());
        println("");
    }

    @Override
    public void visit(LUI node) {
        print("lui ");
        node.res.accept(this);
        printlnInline(",%hi(" + node.from.name + ")");
    }


    @Override
    public void visit(PhyReg node) {
        printInline(node.name);
    }

    @Override
    public void visit(StackLoc node) {
        if (!node.isCallerStack)
            printInline(node.idx * 4 + "(sp)");
        else {
            int stackSize = (node.func.stacksize) * 4;
            stackSize = stackSize + (16 - stackSize % 16);
            printInline((node.idx * 4 + stackSize) + "(sp)");
        }
    }

    @Override
    public void visit(LI node) {
        print("li ");
        node.res.accept(this);
        printlnInline(", " + node.imm.getVal());
    }

    private String CreateBBName(String name) {
        name = name;
        if (BBnameCntMap.containsKey(name)) {
            int t = BBnameCntMap.get(name);
            BBnameCntMap.put(name, t + 1);
            return name + (t + 1);
        } else {
            BBnameCntMap.put(name, 1);
            return name + 1;
        }
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


}
