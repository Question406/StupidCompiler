package Utils;

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

    public boolean isCommutative() {
        return  this == MULTI || this == ADD
                || this == LOGICAND || this == LOGICOR
                || this == BITWISEXOR;
    }

    public static BinaryOperator getCommutable(BinaryOperator op){
        switch (op) {
            case BITWISEXOR:
            case LOGICAND:
            case LOGICOR:
            case BITWISEAND:
            case BITWISEOR:
            case MULTI:
            case EQ:
            case NEQ:
            case ADD:
                return op;
            case SUB:
            case DIV:
            case MOD:
            case LEFTSHIFT:
            case RIGHTSHIFT:
                return null;
            case LTH:
                return GTH;
            case LEQ:
                return REQ;
            case GTH:
                return LTH;
            case REQ:
                return LEQ;
            default:
                throw new RuntimeException("getCommutable Err!");
        }
    }
}

