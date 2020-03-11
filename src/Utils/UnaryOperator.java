package Utils;

public enum UnaryOperator {
    // postfix
    POST_ADD("postAdd"), POST_SUB("postSub"),                             // expr ++, --
    // prefix
    POSITIVE("pos"), NEGATIVE("neg"), PREFIX_ADD("preAdd"), PREFIX_SUB("preSub"),     // +, -, ++, -- expr
    BITWISENEG("not") , LOGICNOT("not");                          // ~, ! expr

    private String outputname;

    private UnaryOperator(String name) {
        this.outputname = name;
    }

    public String toString() {
        return outputname;
    }
}