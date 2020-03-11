package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Scope.GlobalScope;
import FrontEnd.Semantic.Scope.LocalScope;
import Utils.DebugOption;
import Utils.Location;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class BlockStatNode extends StatNode {
    ArrayList<StatNode> stats;

    // For Semantic
    LocalScope scope;

    public BlockStatNode(Location location, ArrayList<StatNode> stats) {
        super(location);
        this.stats = stats;
    }

    public void addStat(StatNode stat) {
        stats.add(stat);
    }


    public ArrayList<StatNode> getStats() {
        return stats;
    }

    public void setScope(LocalScope scope) {
        this.scope = scope;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "{" + stats.toString() + "}";
    }

    public void removeStat(ArrayList<ASTNode> toRm) {
        if (DebugOption.isDebugging) {
            for (var stat : stats) {
                System.out.println("rm " + stat);
                stats.remove(toRm);
            }
        } else
            stats.removeAll(toRm);
    }
}
