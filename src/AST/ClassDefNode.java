package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Scope.ClassScope;
import Utils.DebugOption;
import Utils.Location;

import java.util.ArrayList;

public class ClassDefNode extends DefNode {
    String classname;
    ArrayList<VarDefNode> inclassVar;
    ArrayList<FuncDefNode> inclassMethod;

    ClassScope scope;

    public ClassDefNode(Location location, String name, ArrayList<VarDefNode> inClassVar, ArrayList<FuncDefNode> inclassMethod) {
        super(location);
        this.classname = name;
        this.inclassMethod = inclassMethod;
        this.inclassVar = inClassVar;
    }

    @Override
    public void ShowInfo() {
        System.out.println("ClassDefNode");
    }

    public String getClassname() {
        return classname;
    }

    public ArrayList<FuncDefNode> getInclassMethod() {
        return inclassMethod;
    }

    public ArrayList<VarDefNode> getInclassVar() {
        return inclassVar;
    }

    public void setScope(ClassScope scope) {
        this.scope = scope;
    }

    @Override
    public ClassScope getScope() {
        return scope;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "class " + classname + inclassVar.toString() + inclassMethod.toString();
    }

    public ClassTypeNode getClassType() {
        return new ClassTypeNode(location, classname);
    }

    public void removeVarDef(ArrayList<ASTNode> toRm) {
        if (DebugOption.isDebugging) {
            for (var def : toRm) {
                System.out.println(classname + " rm " + ((VarDefNode) def).getID());
                inclassVar.remove(def);
            }
        } else
            inclassVar.removeAll(toRm);
    }

    public void removeMethod(ArrayList<ASTNode> toRm) {
        if (DebugOption.isDebugging) {
            for (var def : toRm) {
                System.out.println(classname + " rm " +     ((FuncDefNode) def).getFuncName());
                inclassMethod.remove(def);
            }
        } else
            inclassMethod.removeAll(toRm);
    }
}
