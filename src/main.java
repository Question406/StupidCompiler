import IR.Interpreter.IRInterpreter;
import IR.Interpreter.Interpreter;
import Test.TestAST;
import Utils.BinaryOperator;

public class main {
    public static void main(String[] args) {
        // to avoid race between error stream && out stream
        System.setErr(System.out);
        TestAST test = new TestAST();//
        try {
            test.run();
//            test.runAll();

        } catch(Exception e) {
            System.out.println("Exception:");
            System.out.println(e.toString());
        };
    }

}