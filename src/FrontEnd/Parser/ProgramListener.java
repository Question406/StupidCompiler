// Generated from /home/jiyi/IdeaProjects/StupidCompiler_v1/src/FrontEnd.Parser/Program.g4 by ANTLR 4.8
package FrontEnd.Parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ProgramParser}.
 */
public interface ProgramListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ProgramParser#builtin_type}.
	 * @param ctx the parse tree
	 */
	void enterBuiltin_type(ProgramParser.Builtin_typeContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#builtin_type}.
	 * @param ctx the parse tree
	 */
	void exitBuiltin_type(ProgramParser.Builtin_typeContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(ProgramParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(ProgramParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#def}.
	 * @param ctx the parse tree
	 */
	void enterDef(ProgramParser.DefContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#def}.
	 * @param ctx the parse tree
	 */
	void exitDef(ProgramParser.DefContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#formalpara}.
	 * @param ctx the parse tree
	 */
	void enterFormalpara(ProgramParser.FormalparaContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#formalpara}.
	 * @param ctx the parse tree
	 */
	void exitFormalpara(ProgramParser.FormalparaContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#formalparas}.
	 * @param ctx the parse tree
	 */
	void enterFormalparas(ProgramParser.FormalparasContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#formalparas}.
	 * @param ctx the parse tree
	 */
	void exitFormalparas(ProgramParser.FormalparasContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(ProgramParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(ProgramParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void enterFuncdef(ProgramParser.FuncdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void exitFuncdef(ProgramParser.FuncdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#vardef}.
	 * @param ctx the parse tree
	 */
	void enterVardef(ProgramParser.VardefContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#vardef}.
	 * @param ctx the parse tree
	 */
	void exitVardef(ProgramParser.VardefContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#constructor_def}.
	 * @param ctx the parse tree
	 */
	void enterConstructor_def(ProgramParser.Constructor_defContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#constructor_def}.
	 * @param ctx the parse tree
	 */
	void exitConstructor_def(ProgramParser.Constructor_defContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#vardec}.
	 * @param ctx the parse tree
	 */
	void enterVardec(ProgramParser.VardecContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#vardec}.
	 * @param ctx the parse tree
	 */
	void exitVardec(ProgramParser.VardecContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#classtype}.
	 * @param ctx the parse tree
	 */
	void enterClasstype(ProgramParser.ClasstypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#classtype}.
	 * @param ctx the parse tree
	 */
	void exitClasstype(ProgramParser.ClasstypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#classdef}.
	 * @param ctx the parse tree
	 */
	void enterClassdef(ProgramParser.ClassdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#classdef}.
	 * @param ctx the parse tree
	 */
	void exitClassdef(ProgramParser.ClassdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#classbody}.
	 * @param ctx the parse tree
	 */
	void enterClassbody(ProgramParser.ClassbodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#classbody}.
	 * @param ctx the parse tree
	 */
	void exitClassbody(ProgramParser.ClassbodyContext ctx);
	/**
	 * Enter a parse tree produced by the {@code var_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 */
	void enterVar_type(ProgramParser.Var_typeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code var_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 */
	void exitVar_type(ProgramParser.Var_typeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code array_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 */
	void enterArray_type(ProgramParser.Array_typeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code array_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 */
	void exitArray_type(ProgramParser.Array_typeContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#type_or_void}.
	 * @param ctx the parse tree
	 */
	void enterType_or_void(ProgramParser.Type_or_voidContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#type_or_void}.
	 * @param ctx the parse tree
	 */
	void exitType_or_void(ProgramParser.Type_or_voidContext ctx);
	/**
	 * Enter a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterSub_expr(ProgramParser.Sub_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitSub_expr(ProgramParser.Sub_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constants_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterConstants_expr(ProgramParser.Constants_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constants_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitConstants_expr(ProgramParser.Constants_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMember_expr(ProgramParser.Member_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMember_expr(ProgramParser.Member_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ID_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterID_expr(ProgramParser.ID_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ID_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitID_expr(ProgramParser.ID_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterBinary_expr(ProgramParser.Binary_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitBinary_expr(ProgramParser.Binary_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIndex_expr(ProgramParser.Index_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIndex_expr(ProgramParser.Index_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterThis_expr(ProgramParser.This_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitThis_expr(ProgramParser.This_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code new_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNew_expr(ProgramParser.New_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code new_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNew_expr(ProgramParser.New_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assign_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAssign_expr(ProgramParser.Assign_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assign_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAssign_expr(ProgramParser.Assign_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterPostfix_expr(ProgramParser.Postfix_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitPostfix_expr(ProgramParser.Postfix_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterPrefix_expr(ProgramParser.Prefix_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitPrefix_expr(ProgramParser.Prefix_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMethod_expr(ProgramParser.Method_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMethod_expr(ProgramParser.Method_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#exprList}.
	 * @param ctx the parse tree
	 */
	void enterExprList(ProgramParser.ExprListContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#exprList}.
	 * @param ctx the parse tree
	 */
	void exitExprList(ProgramParser.ExprListContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#constants}.
	 * @param ctx the parse tree
	 */
	void enterConstants(ProgramParser.ConstantsContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#constants}.
	 * @param ctx the parse tree
	 */
	void exitConstants(ProgramParser.ConstantsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code block_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBlock_stat(ProgramParser.Block_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code block_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBlock_stat(ProgramParser.Block_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code if_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterIf_stat(ProgramParser.If_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code if_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitIf_stat(ProgramParser.If_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code for_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterFor_stat(ProgramParser.For_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code for_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitFor_stat(ProgramParser.For_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code while_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterWhile_stat(ProgramParser.While_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code while_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitWhile_stat(ProgramParser.While_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code break_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBreak_stat(ProgramParser.Break_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code break_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBreak_stat(ProgramParser.Break_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continue_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterContinue_stat(ProgramParser.Continue_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continue_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitContinue_stat(ProgramParser.Continue_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code return_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterReturn_stat(ProgramParser.Return_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code return_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitReturn_stat(ProgramParser.Return_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code vardef_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterVardef_stat(ProgramParser.Vardef_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code vardef_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitVardef_stat(ProgramParser.Vardef_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expr_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterExpr_stat(ProgramParser.Expr_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expr_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitExpr_stat(ProgramParser.Expr_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blank_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBlank_stat(ProgramParser.Blank_statContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blank_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBlank_stat(ProgramParser.Blank_statContext ctx);
	/**
	 * Enter a parse tree produced by the {@code array_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void enterArray_newbody(ProgramParser.Array_newbodyContext ctx);
	/**
	 * Exit a parse tree produced by the {@code array_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void exitArray_newbody(ProgramParser.Array_newbodyContext ctx);
	/**
	 * Enter a parse tree produced by the {@code class_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void enterClass_newbody(ProgramParser.Class_newbodyContext ctx);
	/**
	 * Exit a parse tree produced by the {@code class_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void exitClass_newbody(ProgramParser.Class_newbodyContext ctx);
	/**
	 * Enter a parse tree produced by the {@code builtin_type_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void enterBuiltin_type_newbody(ProgramParser.Builtin_type_newbodyContext ctx);
	/**
	 * Exit a parse tree produced by the {@code builtin_type_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 */
	void exitBuiltin_type_newbody(ProgramParser.Builtin_type_newbodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link ProgramParser#forbody}.
	 * @param ctx the parse tree
	 */
	void enterForbody(ProgramParser.ForbodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link ProgramParser#forbody}.
	 * @param ctx the parse tree
	 */
	void exitForbody(ProgramParser.ForbodyContext ctx);
}