package IR.Interpreter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


class Func {
    Interpreter interpreter;
    String name;
    boolean hasReturnValue;
    BBlock entryBB;
    int retVal;
    List<String> args;
    Map<String, BBlock> BBMap = new HashMap<String, BBlock>();
    Map<String, Reg> regMap;

    BBlock curBB;

    Func(Interpreter interpreter) {
        this.interpreter = interpreter;
    }

    void run() {
        interpreter.curFunc = this;
        curBB = this.entryBB;
        regMap = new HashMap<String, Reg>();

        if (curBB == null)
            throw new RuntimeException("no entry block for function " + name);

        while (true) {
            BBlock BB = curBB;
            if (!Utils.opjump.contains(BB.insts.get(BB.insts.size() - 1).kind))
                throw new RuntimeException("block " + BB.name + " has no end instruction");

            for (var inst : BB.insts) {
                inst.run();
                if (curBB != BB) break;
            }
        }
    }
}
