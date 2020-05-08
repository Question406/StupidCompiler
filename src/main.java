import Test.RealRunner;

import static java.lang.System.exit;

public class main {
    public static void main(String[] args) {
        // to avoid race between error stream && out stream
        // System.setErr(System.out);
        RealRunner test = new RealRunner();
        try {
            boolean isSematic = args[0].equals("semantic");
            test.run(isSematic);
        } catch(Exception e) {
            System.err.println("Exception: ");
            e.printStackTrace();
            exit(1);
        };
    }

}