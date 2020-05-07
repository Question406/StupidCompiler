package RISCV;

public enum BinaryOperator {
    // immediate
    addi("addi"), xori("xori"), ori("ori"), andi("andi"),
    slti("slti"),
    srai("srai"), slli("slli"),

    // reg
    add("add"), sub("sub"), mul("mul"), div("div"), mod("rem"),
    xor("xor"), or("or"), and("and"),
    slt("slt"), sra("sra"), sll("sll"), sltu("sltu");


    private String outputname;

    private BinaryOperator(String name) {
        this.outputname = name;
    }

    public String toString() {
        return outputname;
    }
}