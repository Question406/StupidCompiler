package Utils;

import java.io.PrintStream;

public class ErrorHandler {
    PrintStream outStream;
    long nError;

    public ErrorHandler() {
        outStream = System.err;
    }

    public void error(Location loc, String msg) {
        outStream.println(loc + ": error: " + msg);
        nError++;
    }
}
