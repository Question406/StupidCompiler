package IR.Interpreter;

import Utils.Exception.SemanticException;

import java.io.*;
import java.util.*;

// highlight:   structure based on Chen Lequn Houbohan's implementation of IRInterpreter, but did something  different
//              improvement:
//              1: mem class to simulate memory behavior for string && class variable

public class Interpreter {
    Map<String, Func> funcMap = new HashMap<String, Func>();
    Map<String, Reg> globalRegs = new HashMap<String, Reg>();
    Memory memory = new Memory();

    BufferedReader br;
    int lineno;
    String line;
    boolean isReady;

    int exitcode;
    boolean exception;

    Scanner scanner;

    BBlock curBB;
    Func curFunc;

    int MAXINSTLIMIT = Integer.MAX_VALUE;
    int instCnt = 0;

    public static void main(String[] args) {
        Interpreter interpreter = new Interpreter("//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//ir_out.txt");
        interpreter.run();
    }

    public Interpreter(String inputFile) {
        readInput(inputFile);
    }

    public void run() {
        try {
            if (!isReady) throw new RuntimeException("not ready");
            Func init = funcMap.get("__init");
            if (init == null)
                throw new RuntimeException("cannot find `__init` function");

            init.run();
            exitcode = init.retVal;
            exception = false;
        } catch (RuntimeException e) {
            System.err.println("Runtime Error");
            System.err.println("    " + e.getMessage());
            exitcode = -1;
            exception = true;
        }
        isReady = false;
    }


    // tool funcs read:
    private void readInput(String inputFile) {
        try {
            InputStream in = new FileInputStream(inputFile);
            DataInputStream dataInputStream = new DataInputStream(in);
            scanner = new Scanner(dataInputStream);

            br = new BufferedReader(new InputStreamReader(in));
            while (readLine() != null) {
                if (line.startsWith("define")) {
                    readFunction();
                } else {
                    readGlobalVariable();
                }
            }
            br.close();
            isReady = true;
        } catch (Exception e) {
            System.err.println("Semantic Error");
            System.err.println("    " + e.getMessage());
            exitcode = -1;
            exception = true;
        }
    }

    private String readLine() throws IOException {
        do {
            line = br.readLine();
            if (line == null) break;
            ++lineno;
            line = line.trim();
        } while (line.equals(""));
        return line;
    }

    private void readFunction() throws IOException {
        List<String> words = splitBySpaces(line);
        if (!words.get(words.size() - 1).equals("{")) throw new SemanticException("expected a `{`");
        curFunc = new Func(this);
        curFunc.hasReturnValue = line.startsWith("define i32 ");
        curFunc.name = words.get(2).substring(1);
        curFunc.args = words.subList(3, words.size() - 1);
        if (funcMap.containsKey(curFunc.name))
            throw new SemanticException("function `" + curFunc.name + "` has already been defined");
        funcMap.put(curFunc.name, curFunc);

        while (!readLine().equals("}")) {
            readInst();
        }
    }

    private void readGlobalVariable() {
        if (!line.startsWith("@")) throw new RuntimeException("global variable should start with '@'");
        if (line.contains("=")) {
            //string
            String[] words = line.split("=", 2);
            String name = words[0].trim();
            words[1] = words[1].trim();
            String tmp = words[1].substring(1, words[1].length() - 1);
            var tmpbytes = tmp.getBytes();

            Reg reg = new Reg();
            reg.len = tmpbytes.length;
            reg.val = memory.memAlloc(reg.len);
            memory.memStore(reg.val, tmpbytes);

            // works as a pointer
            globalRegs.put(name, reg);
        } else {
            //other
            String name = line.trim();
            Reg reg = new Reg();
            reg.val = 0;
            globalRegs.put(name, reg);
        }
    }

    private void readInst() {
        // read basic block
        if (line.endsWith(":")) {
            String BBname = line.substring(0, line.length() - 1);
            curBB = new BBlock(BBname, this);
            if (curFunc.BBMap.containsKey(curBB.name))
                throw new SemanticException("label " + curBB.name + "` has already been defined");
            curFunc.BBMap.put(curBB.name, curBB);
            if (curFunc.entryBB == null) curFunc.entryBB = curBB;
            return;
        }

        // read instruction
        String[] split = line.split("=");
        Inst inst = new Inst(this, curFunc);
        List<String> words = splitBySpaces(split[split.length - 1]);
        curBB.insts.add(inst);
        inst.kind = words.get(0);

        if (split.length == 1) {
            if (!Utils.opnames1.contains(inst.kind)) throw new SemanticException("illegal operator " + inst.kind);
        } else if (split.length == 2) {
            if (!Utils.opnames2.contains(inst.kind)) throw new SemanticException("illegal operator " + inst.kind);
        } else {
            throw new SemanticException("illegal operator " + inst.kind);
        }
        inst.line = lineno;
        inst.text = line;

        // save operands to variables
        switch (inst.kind) {
            case "store":
                inst.dest = words.get(1);
                inst.src1 = words.get(2);
                return;
            case "load":
            case "alloc":
                inst.dest = split[0].trim();
                inst.src1 = words.get(1);
                return;
            case "call":
                if (split.length == 2) inst.dest = split[0].trim();
                inst.src1 = words.get(1);
                inst.args = words.subList(2, words.size());
                return;
            case "br":
                inst.dest = words.get(1);
                inst.src1 = words.get(2);
                inst.src2 = words.get(3);
                return;
            default:
                if (split.length == 2) inst.dest = split[0].trim();
                if (inst.kind.equals("ret") && words.size() == 1) return;
                inst.src1 = words.get(1);
                if (Utils.opnum1.contains(inst.kind)) return;
                inst.src2 = words.get(2);
        }
    }

    private List<String> splitBySpaces(String line) {
        return Arrays.asList(line.trim().split(" +"));
    }

}
