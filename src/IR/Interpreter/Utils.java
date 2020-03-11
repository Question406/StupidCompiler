package IR.Interpreter;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

class Utils {
    // instructions that have no destination
    static final Set<String> opnames1 = new HashSet<>(Arrays.asList(
            "store", "br", "jump", "ret", "call"
    ));
    // instructions that have destination
    static final Set<String> opnames2 = new HashSet<>(Arrays.asList(
            "load", "move", "alloc", "call",
            "add", "sub", "mul", "div", "mod",
            "shl", "shr",
            "le", "ge", "gt", "lt",
            "and", "or", "xor", "not"
    ));
    // instructions that have exactly 1 operand
    static final Set<String> opnum1 = new HashSet<>(Arrays.asList(
            "ret", "jump", "move", "not", "alloc"
    ));
    static final Set<String> opjump = new HashSet<>(Arrays.asList(
            "br", "jump", "ret"
    ));

    public static byte[] intToByteArray(int i) {
        byte[] result = new byte[4];
        result[0] = (byte) ((i >> 24) & 0xFF);
        result[1] = (byte) ((i >> 16) & 0xFF);
        result[2] = (byte) ((i >> 8) & 0xFF);
        result[3] = (byte) (i & 0xFF);
        return result;
    }

    public static int byteArrayToInt(byte[] bytes) {
        int value = 0;
        for (int i = 0; i < 4; i++) {
            int shift = (3 - i) * 8;
            value += (bytes[i] & 0xFF) << shift;
        }
        return value;
    }

}
