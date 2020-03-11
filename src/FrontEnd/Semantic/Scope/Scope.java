package FrontEnd.Semantic.Scope;

import AST.DefNode;
import AST.VarDefNode;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.SemanticAnalyzer;
import Utils.Exception.SemanticException;

import javax.swing.*;
import java.util.ArrayList;

abstract public class Scope {
    ArrayList<Scope> subScope;

    public Scope() {
        subScope = new ArrayList<Scope>();
    }

    public ArrayList<Scope> getSubScope() {
        return subScope;
    }

    void addChild(Scope s) {
        subScope.add(s);
    }
    abstract public boolean isGlobal();
    abstract public Scope parent();
    abstract public Entity get(String name) throws SemanticException;

    abstract public void registerEntity(DefNode node) throws Exception;
}
