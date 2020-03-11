// highlight: turns out it's useless facing codegen

package FrontEnd.Semantic;

import AST.*;
import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Entity.FunctionEntity;
import FrontEnd.Semantic.Entity.VariableEntity;
import FrontEnd.Semantic.Scope.*;

import java.util.ArrayList;
import java.util.Stack;

public class UnusedEntityRemover implements ASTVisitor {
    Stack<ArrayList<ASTNode>> tmpToRemove;
    Stack<Scope> scopeStack;
    boolean inFunc;

    public UnusedEntityRemover() {
        scopeStack = new Stack<Scope>();
        tmpToRemove = new Stack<ArrayList<ASTNode>>();
    }

    private Scope curScope() {
        return scopeStack.peek();
    }

    private ArrayList<ASTNode> curRemoveList() {
        return tmpToRemove.peek();
    }

    private void newRemoveList() {
        tmpToRemove.add(new ArrayList<ASTNode>());
    }

    private void delStack() {
        tmpToRemove.pop();
        scopeStack.pop();
    }

    @Override
    public void visit(ProgramNode node) throws Exception {
        scopeStack.push(node.getScope());
        newRemoveList();
        for (var def : node.getProgram_defs())
            def.accept(this);

        node.getProgram_defs().removeAll(curRemoveList());
        delStack();
    }

    @Override
    public void visit(VarDefNode node) throws Exception {
        VariableEntity entity = (VariableEntity) curScope().get(node.getID());
        if (! entity.wasUsed())
            curRemoveList().add(node);
    }

    @Override
    public void visit(FuncDefNode node) throws Exception {
        FunctionEntity entity = (FunctionEntity) curScope().get(node.getFuncName());
        if (! (entity.wasUsed() || node.getFuncName().equals("main"))) {
            curRemoveList().add(node);
        } else {
            inFunc = true;
            scopeStack.push(node.getScope());
            node.getFuncbody().accept(this);
            inFunc = false;
        }
    }

    @Override
    public void visit(ClassDefNode node) throws Exception {
        scopeStack.push(node.getScope());
        newRemoveList();
        for (var def : node.getInclassVar())
            def.accept(this);
        node.removeVarDef(curRemoveList());
        tmpToRemove.pop();

        newRemoveList();
        for (var def : node.getInclassMethod())
            def.accept(this);
        node.removeMethod(curRemoveList());
    }

    @Override
    public void visit(BlockStatNode node) throws Exception {
        if (!inFunc)
            scopeStack.push(node.getScope());
        newRemoveList();
        for (var stat : node.getStats())
            stat.accept(this);
        node.removeStat(curRemoveList());
        delStack();
    }

    @Override
    public void visit(ConstructorDefNode node) throws Exception {
        if (node.getFuncbody() != null)
            node.getFuncbody().accept(this);
    }

    @Override
    public void visit(IFStatNode node) throws Exception {
        if (node.getThen_clause() != null)
            node.getThen_clause().accept(this);

        if (node.getElse_clause() != null)
            node.getElse_clause().accept(this);
    }

    @Override
    public void visit(ForStatNode node) throws Exception {
        if (node.getFor_init() != null)
            node.getFor_init().accept(this);

        if (node.getWhile_body() != null)
            node.getWhile_body().accept(this);
    }

    @Override
    public void visit(BreakStatNode node) throws Exception {

    }

    @Override
    public void visit(ContinueStatNode node) throws Exception {

    }

    @Override
    public void visit(ReturnStatNode node) throws Exception {

    }

    @Override
    public void visit(VarDefStatNode node) throws Exception {
        node.getVarDefs().accept(this);
    }

    @Override
    public void visit(ExprStatNode node) throws Exception {

    }

    @Override
    public void visit(INTEGERNode node) throws Exception {

    }

    @Override
    public void visit(STRINGNode node) throws Exception {

    }

    @Override
    public void visit(NULLNode node) throws Exception {

    }

    @Override
    public void visit(BOOLNode node) throws Exception {

    }

    @Override
    public void visit(IDExprNode node) throws Exception {

    }

    @Override
    public void visit(BinaryExprNode node) throws Exception {

    }

    @Override
    public void visit(PrefixExprNode node) throws Exception {

    }

    @Override
    public void visit(PostFixExprNode node) throws Exception {

    }

    @Override
    public void visit(VarTypeNode node) throws Exception {

    }

    @Override
    public void visit(ArrayTypeNode node) throws Exception {

    }

    @Override
    public void visit(NEWExprNode node) throws Exception {

    }

    @Override
    public void visit(MemberExprNode node) throws Exception {

    }

    @Override
    public void visit(MethodExprNode node) throws Exception {

    }

    @Override
    public void visit(FormalParasNode formalParasNode) throws Exception {

    }

    @Override
    public void visit(IndexExprNode indexExprNode) throws Exception {

    }

    @Override
    public void visit(AssignExprNode assignExprNode) throws Exception {

    }

    @Override
    public void visit(ThisExprNode thisExprNode) throws Exception {

    }

    @Override
    public void visit(WhileStatNode whileStatNode) throws Exception {

    }

    @Override
    public void visit(VoidTypeNode voidTypeNode) throws Exception {

    }

    @Override
    public void visit(ClassTypeNode classTypeNode) {

    }

    @Override
    public void visit(VarDefsNode varDefsNode) throws Exception {
        for (var def : varDefsNode.getVarDefs())
            def.accept(this);
    }
}
