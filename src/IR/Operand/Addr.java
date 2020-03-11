package IR.Operand;

import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.VariableEntity;

// for store, TODO: still need completing
public class Addr extends Operand {
    Entity entity;
    int offset;
    Operand start;

    public Addr(Entity entity) {
        this.entity = entity;
    }

    // FIXME:
    public Addr(Operand start, int offset) {
        this.start = start;
        this.offset = offset;
    }
}
