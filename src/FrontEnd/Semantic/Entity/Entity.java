package FrontEnd.Semantic.Entity;

import AST.TypeNode;
import IR.Operand.Operand;

abstract public class Entity {
    String name;
    TypeNode type;
    long nRefered;

    Operand addr;

    public Entity(TypeNode type, String name) {
        this.name = name;
        this.type = type;
        nRefered = 0;
    }

    public String getName() {
        return name;
    }

    public long getnRefered() {
        return nRefered;
    }

    public TypeNode getType() {
        return type;
    }

    public String name() {
        return name;
    }

    public long getNRefered() {
        return nRefered;
    }

    public void refered() {
//        System.out.println(name + "refered");
        nRefered++;
    }

    public void setAddr(Operand addr) {
        this.addr = addr;
    }

    public Operand getAddr() {
        return addr;
    }

    public boolean wasUsed() {
        return nRefered != 0;
    }
}