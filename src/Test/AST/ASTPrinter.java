/*
    HIGHLIGHT:
    Been tested for a lot of test-cases
    May be a successful ASTBuilder
 */

package Test.AST;

import AST.*;
import FrontEnd.ASTVisitor;

public class ASTPrinter implements ASTVisitor {

//    // print Operator
//    static String toString(BinaryOperator op){
//        switch (op) {
//            case MULTI: return "*";
//            case DIV: return "/";
//            case MOD: return "%";
//            case ADD: return "+";
//            case SUB: return "-";
//            case LEFTSHIFT: return "<<";
//            case RIGHTSHIFT: return ">>";
//            case LEQ: return "<=";
//            case REQ: return ">=";
//            case GTH: return ">";
//            case LTH: return "<";
//            case EQ: return "==";
//            case NEQ: return "!=";
//            case BITWISEAND: return "&";
//            case BITWISEXOR: return "^";
//            case BITWISEOR: return "|";
//            case LOGICAND: return "&&";
//            case LOGICOR: return "||";
//        }
//        return null;
//    }
//
//    static String toString(UnaryOperator op) {
//        switch (op) {
//            case POST_ADD:
//                return "++";
//            case POST_SUB:
//                return "--";
//            case POSITIVE:
//                return "+";
//            case NEGATIVE:
//                return "-";
//            case PREFIX_ADD:
//                return "++";
//            case PREFIX_SUB:
//                return "--";
//            case BITWISENEG:
//                return "~";
//            case LOGICNOT:
//                return "!";
//        }
//        return null;
//    }

    @Override
    public void visit(ProgramNode node) throws Exception {
        System.out.println("Program Start:");
        System.out.println("\t");
        for (var defNode : node.getProgram_defs()) {
            defNode.accept(this);
            if (defNode instanceof VarDefNode)
                System.out.println(";");
        }
    }

    @Override
    public void visit(VarDefNode node) throws Exception {
        node.getType().accept(this);
        System.out.print(" ");
        System.out.print(node.getID());
        if (node.getVarInit() != null) {
            System.out.print(" = ");
            node.getVarInit().accept(this);
        }
//        for (int i = 0; i < node.getSize(); i++) {
//            var var_name = node.getIDs().get(i);
//            var var_init = node.getVarInit().get(i);
//            System.out.print(var_name + " ");
//            if (var_init != null) {
//                System.out.print( " = ");
//                var_init.accept(this);
//            }
//            if (i != node.getSize() - 1)
//                System.out.print(", ");
//        }
    }

    @Override
    public void visit(FuncDefNode node) throws Exception {
//        System.out.println("A Funcdef node:");
//        System.out.println("func name : " + node.getFuncName());
//
//        if (node.getParas() == null)
//            System.out.println("no paras");
//        else
//            System.out.println("has " + node.getParas().size() + " para");
//
//        System.out.println("has " + ((BlockStatNode) node.getFuncbody()).getStats().size() + " stats ");
//        System.out.println();
        node.getFunctype().accept(this);
        System.out.print(" " + node.getFuncName() + "(");
        if (node.getParas() != null) {
            for (var para : node.getParas()) {
                ((VarDefNode) para).accept(this);
                if (! para.equals(node.getParas().get(node.getParas().size() - 1)) )
                    System.out.print(",");
            }
        }
        System.out.println(")");

        if (node.getFuncbody() != null){
            node.getFuncbody().accept(this);
        }
    }

    @Override
    public void visit(ClassDefNode node) throws Exception {
//        System.out.println("A classdef node:");
//        System.out.println("class name : " + node.getClassname());
//        System.out.println("has " + node.getInclassVar().size() + " member var");
//        System.out.println("has " + (node.getInclassMethod().size() - 1) + " member func");
//        for (var func : node.getInclassMethod())
//            func.accept(this);
//        System.out.println();
        System.out.println("class " + node.getClassname() + "{");
        if (node.getInclassVar() != null) {
            for (var member_var : node.getInclassVar()) {
                member_var.accept(this);
                System.out.println(";");
            }
        }
        if (node.getInclassMethod() != null) {
            for (var member_func : node.getInclassMethod())
                member_func.accept(this);
        }
        System.out.println("}");
    }

    @Override
    public void visit(BlockStatNode node) throws Exception {
        System.out.println("{");
        for (var stat : node.getStats())
            stat.accept(this);
        System.out.println("}");
    }

    @Override
    public void visit(ConstructorDefNode node) throws Exception {
        System.out.print(node.getFuncName() + "(");
        if (node.getParas() != null) {
            for (var para : node.getParas())
                para.accept(this);
        }
        System.out.println(")");

        if (node.getFuncbody() != null){
            node.getFuncbody().accept(this);
        }
    }

    @Override
    public void visit(IFStatNode node) throws Exception {
        System.out.print("if (");
        node.getCond().accept(this);
        System.out.print(")");
        node.getThen_clause().accept(this);
        if (node.getElse_clause() != null) {
            System.out.println("else ");
            node.getElse_clause().accept(this);
        }
    }

    @Override
    public void visit(ForStatNode node) throws Exception {
        System.out.print("for (");
        if (node.getFor_init() != null)
            node.getFor_init().accept(this);
        System.out.print(";");
        if (node.getFor_end() != null)
            node.getFor_end().accept(this);
        System.out.print(";");
        if (node.getFor_update() != null)
            node.getFor_update().accept(this);
        System.out.println(")");
        node.getWhile_body().accept(this);
    }

    @Override
    public void visit(BreakStatNode node) {
        System.out.println("break;");
    }

    @Override
    public void visit(ContinueStatNode node) {
        System.out.println("continue;");
    }

    @Override
    public void visit(ReturnStatNode node) throws Exception {
        System.out.print("return ");
        if (node.getReturn_expr() != null)
            node.getReturn_expr().accept(this);
        System.out.println(";");
    }

    @Override
    public void visit(VarDefStatNode node) throws Exception {
        node.getVarDefs().accept(this);
        System.out.println(";");
    }

    @Override
    public void visit(ExprStatNode node) throws Exception {
        node.getExpr().accept(this);
        System.out.println(";");
    }

    @Override
    public void visit(INTEGERNode node) {
        System.out.print(node.getValue());
    }

    @Override
    public void visit(STRINGNode node) {
        System.out.print(node.getValue());
    }

    @Override
    public void visit(NULLNode node) {
        System.out.print("null");
    }

    @Override
    public void visit(BOOLNode node) {
        System.out.print(node.getBool_val());
    }

    @Override
    public void visit(IDExprNode node) {
        System.out.print(node.getName());
    }

    // atom expr don't need "( expr )"
    static boolean is_Atom(ExprNode node) {
        if (node instanceof STRINGNode || node instanceof INTEGERNode
        ||  node instanceof NULLNode || node instanceof IDExprNode)
            return true;
        return false;
    }

    @Override
    public void visit(BinaryExprNode node) throws Exception {
        if (! is_Atom(node.getLHS())) {
            System.out.print("(");
            node.getLHS().accept(this);
            System.out.print(")");
        } else
            node.getLHS().accept(this);

        System.out.print(" " + node.getOp() + " ");
        if (! is_Atom(node.getRHS())) {
            System.out.print("(");
            node.getRHS().accept(this);
            System.out.print(")");
        } else
            node.getRHS().accept(this);
    }

    @Override
    public void visit(PrefixExprNode node) throws Exception {
        System.out.print(node.getOp());
        node.getSubExpr().accept(this);
    }

    @Override
    public void visit(PostFixExprNode node) throws Exception {
        node.getExpr().accept(this);
        System.out.print(node.getOp());
    }

    @Override
    public void visit(VarTypeNode node) {
        System.out.print(node.name());
    }

    @Override
    public void visit(ArrayTypeNode node) {
        System.out.print(node.name());
        for (int i = 0; i < node.getDim(); i++)
            System.out.print("[]");
    }

    @Override
    public void visit(NEWExprNode node) throws Exception {
        System.out.print("new ");
       // System.out.print(node.getType().getName());
        for (int i = 0; i < node.getDim(); i++) {
            System.out.print("[");
            if (node.getDimExpr().get(i) != null)
                node.getDimExpr().get(i).accept(this);
            System.out.print("]");
        }
    }

    @Override
    public void visit(MemberExprNode node) throws Exception {
        node.getWhose().accept(this);
        System.out.print(".");
        System.out.print(node.getmemberID());
    }

    @Override
    public void visit(MethodExprNode node) throws Exception {
        node.getWhose().accept(this);
        System.out.print("(");
        if (node.getParas() != null) {
            for (int i = 0; i < node.getParas().size(); i++) {
                var tmp_para = node.getParas().get(i);
                tmp_para.accept(this);
                if (i != node.getParas().size() - 1)
                    System.out.print(",");
            }
        }
        System.out.print(")");
    }

    @Override
    public void visit(FormalParasNode formalParasNode) throws Exception {
        for (int i = 0; i < formalParasNode.getParaList().size(); i++){
            var tmp_para = formalParasNode.getParaList().get(i);
            tmp_para.accept(this);
            if (i != formalParasNode.getParaList().size() - 1)
                System.out.print(",");
        }
    }

    @Override
    public void visit(IndexExprNode indexExprNode) throws Exception {
        indexExprNode.getArray().accept(this);
        System.out.print("[");
        indexExprNode.getIndex().accept(this);
        System.out.print("]");
    }

    @Override
    public void visit(AssignExprNode assignExprNode) throws Exception {
        assignExprNode.getLhs().accept(this);
        System.out.print(" = ");
        assignExprNode.getRhs().accept(this);
    }

    @Override
    public void visit(ThisExprNode thisExprNode) {
        System.out.print("this");
    }

    @Override
    public void visit(WhileStatNode whileStatNode) throws Exception {
        System.out.print("while (");
        whileStatNode.getCond().accept(this);
        System.out.println(")");
        whileStatNode.getWhile_body().accept(this);
    }

    @Override
    public void visit(VoidTypeNode voidTypeNode) {
        System.out.print("void");
    }

    @Override
    public void visit(ClassTypeNode classTypeNode) {

    }

    @Override
    public void visit(VarDefsNode varDefsNode) throws Exception {
        for (var vardef : varDefsNode.getVarDefs())
            vardef.accept(this);
    }
}
