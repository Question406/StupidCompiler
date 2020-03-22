import Test.RealRunner;

import static java.lang.System.exit;

public class main {
    public static void main(String[] args) {
        // to avoid race between error stream && out stream
//        System.setErr(System.out);
        RealRunner test = new RealRunner();//
        try {
            test.SemanticTest();
//            test.run();
//            test.runAll();

        } catch(Exception e) {
//            System.out.println("Exception:");
//            System.out.println(e.toString());
            System.err.println("Exception: ");
            System.err.println(e.toString());
            exit(1);
        };
    }

}