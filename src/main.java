import Test.RealRunner;

import static java.lang.System.exit;

public class main {
    public static void main(String[] args) {
        // to avoid race between error stream && out stream
        // System.setErr(System.out);
        RealRunner test = new RealRunner();
        try {
            test.run();
        } catch(Exception e) {
            System.err.println("Exception: ");
            e.printStackTrace();
            exit(1);
        };
        exit(0);
    }

}