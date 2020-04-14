package Utils;

import java.util.regex.Pattern;

public class CommonFunc {
    public static void printAnything(Object obj) {
        System.out.print(obj);
    }

    public static void printlnAnything(Object obj) {
        System.out.println(obj);
    }

    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

}
