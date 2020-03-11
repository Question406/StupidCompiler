package FrontEnd;

import AST.*;

public interface ASTVisitor {
    void visit(ProgramNode node) throws Exception;

    // Def Node
    void visit(VarDefNode node) throws Exception;
    void visit(FuncDefNode node) throws Exception;
    void visit(ClassDefNode node) throws Exception;

    // Stat Node
    void visit(BlockStatNode node) throws Exception;
    void visit(ConstructorDefNode node) throws Exception;
    void visit(IFStatNode node) throws Exception;
    void visit(ForStatNode node) throws Exception;
    void visit(BreakStatNode node) throws Exception;
    void visit(ContinueStatNode node) throws Exception;
    void visit(ReturnStatNode node) throws Exception;
    void visit(VarDefStatNode node) throws Exception;
    void visit(ExprStatNode node) throws Exception;

    // ExprNode
    void visit(INTEGERNode node) throws Exception;
    void visit(STRINGNode node) throws Exception;
    void visit(NULLNode node) throws Exception;
    void visit(BOOLNode node) throws Exception;

    void visit(IDExprNode node) throws Exception;

    void visit(BinaryExprNode node) throws Exception;
    void visit(PrefixExprNode node) throws Exception;
    void visit(PostFixExprNode node) throws Exception;

    void visit(VarTypeNode node) throws Exception;
    void visit(ArrayTypeNode node) throws Exception;
    void visit(NEWExprNode node) throws Exception;
    void visit(MemberExprNode node) throws Exception;
    void visit(MethodExprNode node) throws Exception;

    void visit(FormalParasNode node) throws Exception;

    void visit(IndexExprNode node) throws Exception;

    void visit(AssignExprNode node) throws Exception;

    void visit(ThisExprNode node) throws Exception;

    void visit(WhileStatNode node) throws Exception;

    void visit(VoidTypeNode node) throws Exception;

    void visit(ClassTypeNode node);

    void visit(VarDefsNode node) throws Exception;
}
