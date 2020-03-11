package Utils;

//public enum BinaryOperator {
//    MULTI("mul"), DIV("div"), MOD("mod"),
//    ADD("add"), SUB("sub"),
//    LEFTSHIFT("shl"), RIGHTSHIFT("shr"),
//    LEQ("le"), REQ("ge"), GTH("gt"), LTH("lt"),   // less or equal, greator than
//    EQ("eq"), NEQ("neq"),
//    BITWISEAND("and"),
//    BITWISEXOR("xor"),
//    BITWISEOR("or"),
//    LOGICAND("not"),
//    LOGICOR("or");
//
//    private String outputname;
//
//    private BinaryOperator(String name) {
//        this.outputname = name;
//    }
//
//    public String toString() {
//        return outputname;
//    }
//}
//

public enum BinaryOperator {
    MULTI("mul"), DIV("div"), MOD("mod"),
    ADD("add"), SUB("sub"),
    LEFTSHIFT("shl"), RIGHTSHIFT("shr"),
    LEQ("sle"), REQ("sge"), GTH("sgt"), LTH("slt"),   // less or equal, greator than
    EQ("seq"), NEQ("sne"),
    BITWISEAND("and"),
    BITWISEXOR("xor"),
    BITWISEOR("or"),
    LOGICAND("and"),
    LOGICOR("or");

    private String outputname;

    private BinaryOperator(String name) {
        this.outputname = name;
    }

    public String toString() {
        return outputname;
    }
}
