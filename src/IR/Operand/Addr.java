package IR.Operand;

import FrontEnd.Semantic.Entity.Entity;

// for store, TODO: still need completing
public class Addr extends Operand {
    Entity entity;
    int offset;
    Operand start;

    public Addr(Entity entity) {
        super("null");
        this.entity = entity;
    }

    // FIXME:
    public Addr(Operand start, int offset) {
        super("null");
        this.start = start;
        this.offset = offset;
    }
}
