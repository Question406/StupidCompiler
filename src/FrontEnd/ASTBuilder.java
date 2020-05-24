package FrontEnd;

import AST.*;
import FrontEnd.Parser.ProgramBaseVisitor;
import FrontEnd.Parser.ProgramParser;
import Utils.BinaryOperator;
import Utils.Exception.SyntaxException;
import Utils.Location;
import Utils.UnaryOperator;

import java.util.ArrayList;

import static Utils.BinaryOperator.*;
import static Utils.UnaryOperator.*;

public class ASTBuilder extends ProgramBaseVisitor<ASTNode> {

    // A program consists of some defs
    // rule: program : def*;
    public ASTNode visitProgram(ProgramParser.ProgramContext ctx) {
        ArrayList<DefNode> program_defs = new ArrayList<DefNode>();
        for (var tmp_def : ctx.def()) {
            DefNode tmp = (DefNode)visit(tmp_def);
            if (tmp instanceof VarDefsNode)
                program_defs.addAll(((VarDefsNode) tmp).getVarDefs());
            else
                program_defs.add(tmp);
        }
        return new ProgramNode(new Location(ctx.getStart()), program_defs);
    }

    // Def can be funcdef || classdef || vardef
    // rule: def : classdef | funcdef | vardef;
    public ASTNode visitDef(ProgramParser.DefContext ctx) {
        if (ctx.funcdef() != null) {
            return visit(ctx.funcdef());
        } else if (ctx.classdef() != null) {
            return visit(ctx.classdef());
        } else if (ctx.vardef() != null) {
            return visit(ctx.vardef());
        }

        System.out.println("visitDef Error");
        return null;
    }

    @Override
    public ASTNode visitType_or_void(ProgramParser.Type_or_voidContext ctx) {
        if (ctx.type() != null)
            return (TypeNode) ctx.type().accept(this);
        else
            return new VoidTypeNode(new Location(ctx.getStart()), "void");
    }

    // funcdef rule : type_or_void ID '(' formalparas ')' block;
    // funcdef consists of type, name, para, funcbody
    public ASTNode visitFuncdef(ProgramParser.FuncdefContext ctx){
        Location loc = new Location(ctx.getStart());
        TypeNode func_type = null;
        if (ctx.type_or_void() != null)
            func_type = (TypeNode) ctx.type_or_void().accept(this);
        String func_name = new String(ctx.ID().getText());
        ArrayList<VarDefNode> paras = null;
        // FIXME: try
        if (ctx.formalparas().getChild(0) != null) {
            paras = new ArrayList<VarDefNode>();
            for (var tmp_para : ctx.formalparas().formalpara()) {
                paras.addAll(((VarDefsNode) visitFormalpara(tmp_para)).getVarDefs());
            }
        }
        BlockStatNode funcbody = (BlockStatNode) visit(ctx.block());

        return new FuncDefNode(loc, func_type, func_name, paras, funcbody);
    }

    // type rule : (name = classtype | builtin_type)                          # var_type
    //           | ((name = classtype | builtin_type) ('[' ']')+)             # array_type
    public ASTNode visitVar_type(ProgramParser.Var_typeContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new VarTypeNode(loc, ctx.getText());
    }

    public ASTNode visitArray_type(ProgramParser.Array_typeContext ctx) {
        Location loc = new Location(ctx.getStart());
        String typename = ctx.getChild(0).getText();
        String text = ctx.getText();
        int dim = text.length() - (text.replaceAll("]", "")).length();
        return new ArrayTypeNode(loc, typename, dim);
    }

    // block : '{' stat* '}';
    public ASTNode visitBlock(ProgramParser.BlockContext ctx){
        Location loc = new Location(ctx.getStart());
        ArrayList<StatNode> stats = null;
        if (ctx.stat() != null) {
            stats = new ArrayList<StatNode>();
            for (var tmp_stat : ctx.stat())
                stats.add((StatNode) visit(tmp_stat));
        }
        return new BlockStatNode(loc, stats);
    }

    // formal para rule: type ID;
    public ASTNode visitFormalpara(ProgramParser.FormalparaContext ctx) {
        Location loc = new Location(ctx.getStart());
        TypeNode paratype = (TypeNode) visit(ctx.type());
        ArrayList<VarDefNode> varDefs = new ArrayList<VarDefNode>();
        varDefs.add(new VarDefNode(loc, paratype, ctx.ID().getText(), null));
        return new VarDefsNode(loc, varDefs);
    }

    // classdef rule : classdef : CLASS ID classbody ';'
    // classdef consists of classname, classbody
    public ASTNode visitClassdef(ProgramParser.ClassdefContext ctx) {
        Location loc = new Location(ctx.getStart());
        String className = ctx.ID().getText();
        ArrayList<VarDefNode> varDefNodes = new ArrayList<VarDefNode>();
        for (var vardef : ctx.classbody().vardef()) {
            varDefNodes.addAll(((VarDefsNode) visit(vardef)).getVarDefs());
        }

        ArrayList<FuncDefNode> FuncDefNodes = new ArrayList<FuncDefNode>();
        for (var funcdef : ctx.classbody().constructor_def()) {
            FuncDefNodes.add((ConstructorDefNode) visit(funcdef));
                //FuncDefNodes.add((FuncDefNode) visit(funcdef));
        }

        for (var funcdef : ctx.classbody().funcdef()) {
            FuncDefNodes.add((FuncDefNode) visit(funcdef));
        }

        return new ClassDefNode(loc, className, varDefNodes, FuncDefNodes);
    }

    public ASTNode visitConstructor_def(ProgramParser.Constructor_defContext ctx) {
        Location loc = new Location(ctx.getStart());
        String name = ctx.ID().getText();
        ArrayList<VarDefNode> paras = null;
        if (ctx.formalparas().getChild(0) != null) {
            paras = new ArrayList<VarDefNode>();
            for (var tmp_para : ctx.formalparas().formalpara()) {
                paras.add((VarDefNode) visitFormalpara(tmp_para));
            }
        }
        BlockStatNode funcbody = (BlockStatNode) visit(ctx.block());

        return new ConstructorDefNode(loc, name, paras, funcbody);
    }

    // vardef rule : vardef : type vardec (',' vardec)* ';'
    // vardef consists of type, some ID (init)?
    public ASTNode visitVardef(ProgramParser.VardefContext ctx){
        Location loc = new Location(ctx.getStart());
        ArrayList<VarDefNode> varDefs = new ArrayList<VarDefNode>();
        TypeNode type = (TypeNode) visit(ctx.type());

        for (var tmp_pair : ctx.vardec()) {
            if (tmp_pair.expr() != null) {
                ExprNode expr = (ExprNode) visit(tmp_pair.expr());
                varDefs.add(new VarDefNode(loc, type, tmp_pair.ID().getText(), expr));
            } else {
                varDefs.add(new VarDefNode(loc, type, tmp_pair.ID().getText(), null));
            }
        }

        return new VarDefsNode(loc, varDefs);
    }

    // stat rule :  block                                      # block_stat
    //        | IF '(' expr ')' stat (ELSE stat)?          # if_stat
    //        | FOR '(' forbody ')' stat?                  # for_stat
    //        | WHILE '(' expr ')' stat?                   # while_stat
    //        | BREAK ';'                                  # break_stat
    //        | CONTINUE ';'                               # continue_stat
    //        | RETURN expr? ';'                           # return_stat
    //        | vardef                                     # vardef_stat
    //        | expr ';'                                   # expr_stat
    //        ;

    // block_stat rule : '{' stat* '}'
    public ASTNode visitBlock_stat(ProgramParser.Block_statContext ctx){
        Location loc = new Location(ctx.getStart());
        ArrayList<StatNode> stats = new ArrayList<StatNode>();
        for (var stat : ctx.block().stat()) {
            StatNode tmp = (StatNode) visit(stat);
            stats.add(tmp);
        }
        return new BlockStatNode(loc, stats);
    }

    // if_stat rule: IF '(' expr ')' stat (ELSE stat)?
    public ASTNode visitIf_stat(ProgramParser.If_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode cond = (ExprNode) visit(ctx.cond);
        StatNode thenClause = (StatNode) visit(ctx.stat(0));
        StatNode elseClause = null;
        if (ctx.stat(1) != null)
            elseClause = (StatNode) visit(ctx.stat(1));
        return new IFStatNode(loc, cond, thenClause, elseClause);
    }

    // for_stat rule : FOR '(' forbody ')' stat?
    public ASTNode visitFor_stat(ProgramParser.For_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        // TODO: a try of For_Stat
        ASTNode for_init = null;
        ExprNode for_endexpr = null, for_update = null;
        if (ctx.forbody().for_initVarDef != null)
            for_init = visit(ctx.forbody().for_initVarDef);
        else if (ctx.forbody().for_initExpr != null)
            for_init = visit(ctx.forbody().for_initExpr);
        if (ctx.forbody().for_endexpr != null)
            for_endexpr = (ExprNode) visit(ctx.forbody().for_endexpr);
        if (ctx.forbody().for_update != null)
            for_update = (ExprNode) visit(ctx.forbody().for_update);

        StatNode stat = null;
        if (ctx.stat() != null)
            stat = (StatNode) visit(ctx.stat());

        return new ForStatNode(loc, for_init, for_endexpr, for_update, stat);
    }

    // while_stat rule : WHILE '(' expr ')' stat?
    public ASTNode visitWhile_stat(ProgramParser.While_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode cond = (ExprNode) visit(ctx.cond);
        StatNode while_body = (StatNode) visit(ctx.stat());
        return new WhileStatNode(loc, cond, while_body);
    }

    // break_stat rule : BREAK ';'
    public ASTNode visitBreak_stat(ProgramParser.Break_statContext ctx){
        Location loc = new Location(ctx.getStart());
        return new BreakStatNode(loc);
    }

    // continue_stat rule : Continue ';'
    public ASTNode visitContinue_stat(ProgramParser.Continue_statContext ctx){
        Location loc = new Location(ctx.getStart());
        return new ContinueStatNode(loc);
    }

    // return_stat rule : RETURN expr? ';'
    public ASTNode visitReturn_stat(ProgramParser.Return_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode ret = null;
        if (ctx.ret != null)
            ret = (ExprNode) visit(ctx.ret);
        return new ReturnStatNode(loc, ret);
    }

    // vardef_stat rule : type vardec (',' vardec)* ';';
    public ASTNode visitVardef_stat(ProgramParser.Vardef_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        VarDefsNode varDefs = (VarDefsNode) visit(ctx.vardef());
        return new VarDefStatNode(loc, varDefs);
    }

    // expr_stat rule : expr ';'
    public ASTNode visitExpr_stat(ProgramParser.Expr_statContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = (ExprNode) visit(ctx.expr());
        return new ExprStatNode(loc, expr);
    }

    // expr
    //    : atom                                                  # atom_expr
    //    | NEW new_body                                          # new_expr
    //    | expr op ='.' ID                                       # member_expr
    //    | expr '[' expr ']'                                     # index_expr
    //    | expr '(' exprList? ')'                                # method_expr
    //    | expr ('++' | '--')                                    # postfix_expr
    //    | op = ('+' | '-' | '++' | '--') expr                   # prefix_expr
    //    | op = ('~' | '!') expr                                 # prefix_expr
    //    | expr op = ('*' | '/' | '%') expr                      # binary_expr
    //    | expr op = ('+' | '-') expr                            # binary_expr
    //    | expr op = ('<<' | '>>') expr                          # binary_expr
    //    | expr op = ('<=' | '>=' | '>' | '<') expr              # binary_expr
    //    | expr op = ('==' | '!=') expr                          # binary_expr
    //    | expr op = '&' expr                                    # binary_expr
    //    | expr op = '^' expr                                    # binary_expr
    //    | expr op = '|' expr                                    # binary_expr
    //    | expr op = '&&' expr                                   # binary_expr
    //    | expr op = '||' expr                                   # binary_expr
    //    | <assoc = right> expr op = '=' expr                    # assign_expr
    //;

    @Override
    public ASTNode visitConstants_expr(ProgramParser.Constants_exprContext ctx) {
        return visit(ctx.constants());
    }

    @Override
    public ASTNode visitID_expr(ProgramParser.ID_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        String name = ctx.ID().getText();
        return new IDExprNode(loc, name);
    }

    public ASTNode visitConstants(ProgramParser.ConstantsContext ctx) {
        Location loc = new Location(ctx.getStart());
        if (ctx.Bool_constant() != null)
            return new BOOLNode(loc, ctx.Bool_constant().getText());
        if (ctx.INTEGER() != null)
            return new INTEGERNode(loc, ctx.INTEGER().getText());
        if (ctx.STR_constant() != null)
            return new STRINGNode(loc, ctx.STR_constant().getText());
        if (ctx.NULL() != null)
            return new NULLNode(loc);
        System.out.println("Error in visitConstants");
        return null;
    }

    @Override
    public ASTNode visitThis_expr(ProgramParser.This_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new ThisExprNode(loc);
    }

    // New_expr rule : NEW new_body
    public ASTNode visitNew_expr(ProgramParser.New_exprContext ctx) {
        return (NEWExprNode) visit(ctx.new_body());
    }

    // such as : new int; new long; new String
    public ASTNode visitBuiltin_type_newbody(ProgramParser.Builtin_type_newbodyContext ctx) {
        Location loc = new Location(0, 0);
        TypeNode typeNode = new VarTypeNode(loc, ctx.builtin_type().getText());
        return new NEWExprNode(loc, typeNode, null);
    }


    // such as : new int[4][]...
    public ASTNode visitArray_newbody(ProgramParser.Array_newbodyContext ctx) {
        Location loc = new Location(ctx.getStart());

        String typename = ctx.children.get(0).getText();
        String text = ctx.getText();
        int dim = text.length() - (text.replaceAll("]", "")).length();

        // highlight:   a stupid way to check valid array new body
        //              as changing the syntax rule is too difficult && not that necessary
        boolean isValidNewBody = true;
        boolean hasInitFromBack = false;
        for (int i = text.length() - 1; i >= text.indexOf("["); i--) {
            if (text.charAt(i) == ']') {
                if (!hasInitFromBack) {
                    if (text.charAt(i - 1) != '[') {
                        hasInitFromBack = true;
                        continue;
                    }
                }
                if (hasInitFromBack && text.charAt(i - 1) == '[') {
                    isValidNewBody = false;
                    throw new SyntaxException("wrong array newbody");
                }
            }
        }

        ArrayList<ExprNode> dim_init = new ArrayList<ExprNode>();
        for (var tmp_expr : ctx.expr()) {
            dim_init.add((ExprNode) (visit(tmp_expr)));
        }
//        for (int i = dim_init.size(); i < dim; i++)
//            dim_init.add(null);
        return new NEWExprNode(loc, new ArrayTypeNode(loc, typename, dim), dim_init);
    }

    // such as : point(2, 3, 4);
    public ASTNode visitClass_newbody(ProgramParser.Class_newbodyContext ctx) {
        Location loc = new Location(ctx.getStart());
        TypeNode typeNode = new VarTypeNode(loc, ctx.classtype().getText());
        int dim = 0;
        ArrayList<ExprNode> paras = null;
        if (ctx.para != null) {
            dim = ctx.para.getChildCount();
            paras = (dim == 0) ? null : new ArrayList<ExprNode>();
            for (var para_expr : ctx.para.children)
                paras.add((ExprNode) visit(para_expr));
        }
        return new NEWExprNode(loc, typeNode, paras);
    }

    // Member_expr rule : expr op ='.' ID
    public ASTNode visitMember_expr(ProgramParser.Member_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode whose = (ExprNode) visit(ctx.expr());
        String memberID = ctx.ID().getText();
        return new MemberExprNode(loc, whose, memberID);
    }

    // index_expr rule : expr '[' expr ']'
    @Override
    public ASTNode visitIndex_expr(ProgramParser.Index_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode array = (ExprNode) visit(ctx.array);
        ExprNode index = (ExprNode) visit(ctx.index);
        return new IndexExprNode(loc, array, index);
    }

    // method_expr rule : expr '(' exprList? ')'
    @Override
    public ASTNode visitMethod_expr(ProgramParser.Method_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode whose = (ExprNode) visit(ctx.expr());
        ArrayList<ExprNode> paras = null;
        if (ctx.exprList() != null) {
            paras = new ArrayList<ExprNode>();
            for (var tmp : ctx.exprList().expr())
                paras.add((ExprNode) visit(tmp));
        }
        return new MethodExprNode(loc, whose, paras);
    }

    // postfix_expr : expr ('++' | '--')
    @Override
    public ASTNode visitPostfix_expr(ProgramParser.Postfix_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode self_Expr = (ExprNode) visit(ctx.expr());
        UnaryOperator op = (ctx.op.getText().equals("++"))? POST_ADD : POST_SUB;
        return new PostFixExprNode(loc, self_Expr, op);
    }

    // rule : op = ('+' | '-' | '++' | '--') expr
    @Override
    public ASTNode visitPrefix_expr(ProgramParser.Prefix_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode self_Expr = (ExprNode) visit(ctx.expr());
        UnaryOperator op = null;
        switch (ctx.op.getText()){
            case "+" : op = POSITIVE; break;
            case "-" : op = NEGATIVE; break;
            case "++" : op = PREFIX_ADD; break;
            case "--" : op = PREFIX_SUB; break;
            case "~" : op = BITWISENEG; break;
            case "!" : op = LOGICNOT; break;
        }
        return new PrefixExprNode(loc, op, self_Expr);
    }

    @Override
    public ASTNode visitSub_expr(ProgramParser.Sub_exprContext ctx) {
        return visit(ctx.expr());
    }

    @Override
    public ASTNode visitBlank_stat(ProgramParser.Blank_statContext ctx) {
        return null;
    }

    // rule : lhs = expr op = ('*' | '/' | '%')         rhs = expr
    @Override
    public ASTNode visitBinary_expr(ProgramParser.Binary_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        BinaryOperator op = null;
        switch (ctx.op.getText()){
            case "*" : op = MULTI; break;
            case "/" : op = DIV; break;
            case "%" : op = MOD; break;

            case "+" : op = ADD; break;
            case "-" : op = SUB; break;

            case "<<" : op = LEFTSHIFT; break;
            case ">>" : op = RIGHTSHIFT; break;

            case "<=" : op = LEQ; break;
            case ">=" : op = REQ; break;
            case ">" : op = GTH; break;
            case "<" : op = LTH; break;

            case "==" : op = EQ; break;
            case "!=" : op = NEQ; break;

            case "&" : op = BITWISEAND; break;
            case "^" : op = BITWISEXOR; break;
            case "|" : op = BITWISEOR; break;

            case "&&" : op = LOGICAND; break;
            case "||" : op = LOGICOR; break;
        }
        ExprNode lhs = (ExprNode) visit(ctx.lhs);
        ExprNode rhs = (ExprNode) visit(ctx.rhs);
        return new BinaryExprNode(loc, op, lhs, rhs);
    }

    // rule : lhs = expr op = '=' rhs = expr
    @Override
    public ASTNode visitAssign_expr(ProgramParser.Assign_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode lhs = (ExprNode) visit(ctx.lhs);
        ExprNode rhs = (ExprNode) visit(ctx.rhs);
        return new AssignExprNode(loc, lhs, rhs);
    }

    @Override
    public ASTNode visitExprList(ProgramParser.ExprListContext ctx) {
        return super.visitExprList(ctx);
    }
}
