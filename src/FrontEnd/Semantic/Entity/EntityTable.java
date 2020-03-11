package FrontEnd.Semantic.Entity;

import Utils.Exception.SemanticException;

import java.util.LinkedHashMap;
import java.util.Map;

public class EntityTable {
    Map<String, Entity> table;

    public EntityTable() {
        table = new LinkedHashMap<String, Entity>();
    }

    public boolean hasEntity(String name) {
        return table.containsKey(name);
    }

    public Entity getEntity(String name) {
        return table.get(name);
    }

    public void put(String name, Entity entity) {
        if (table.containsKey(name))
            throw new SemanticException("duplicated def of entity " + name);
        else
            table.put(name, entity);
    }

}
