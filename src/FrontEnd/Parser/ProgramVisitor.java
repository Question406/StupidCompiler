// Generated from /home/jiyi/IdeaProjects/StupidCompiler_v1/src/FrontEnd.Parser/Program.g4 by ANTLR 4.8
package FrontEnd.Parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link ProgramParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface ProgramVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link ProgramParser#builtin_type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBuiltin_type(ProgramParser.Builtin_typeContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(ProgramParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#def}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDef(ProgramParser.DefContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#formalpara}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFormalpara(ProgramParser.FormalparaContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#formalparas}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFormalparas(ProgramParser.FormalparasContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(ProgramParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#funcdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncdef(ProgramParser.FuncdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#vardef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardef(ProgramParser.VardefContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#constructor_def}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructor_def(ProgramParser.Constructor_defContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#vardec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardec(ProgramParser.VardecContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#classtype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClasstype(ProgramParser.ClasstypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#classdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassdef(ProgramParser.ClassdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#classbody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassbody(ProgramParser.ClassbodyContext ctx);
	/**
	 * Visit a parse tree produced by the {@code var_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVar_type(ProgramParser.Var_typeContext ctx);
	/**
	 * Visit a parse tree produced by the {@code array_type}
	 * labeled alternative in {@link ProgramParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArray_type(ProgramParser.Array_typeContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#type_or_void}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType_or_void(ProgramParser.Type_or_voidContext ctx);
	/**
	 * Visit a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSub_expr(ProgramParser.Sub_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code constants_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstants_expr(ProgramParser.Constants_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMember_expr(ProgramParser.Member_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ID_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitID_expr(ProgramParser.ID_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBinary_expr(ProgramParser.Binary_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIndex_expr(ProgramParser.Index_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThis_expr(ProgramParser.This_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code new_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNew_expr(ProgramParser.New_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code assign_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssign_expr(ProgramParser.Assign_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPostfix_expr(ProgramParser.Postfix_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrefix_expr(ProgramParser.Prefix_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link ProgramParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMethod_expr(ProgramParser.Method_exprContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#exprList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprList(ProgramParser.ExprListContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#constants}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstants(ProgramParser.ConstantsContext ctx);
	/**
	 * Visit a parse tree produced by the {@code block_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock_stat(ProgramParser.Block_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code if_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIf_stat(ProgramParser.If_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code for_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFor_stat(ProgramParser.For_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code while_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhile_stat(ProgramParser.While_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code break_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreak_stat(ProgramParser.Break_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code continue_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinue_stat(ProgramParser.Continue_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code return_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturn_stat(ProgramParser.Return_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code vardef_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardef_stat(ProgramParser.Vardef_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expr_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr_stat(ProgramParser.Expr_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code blank_stat}
	 * labeled alternative in {@link ProgramParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlank_stat(ProgramParser.Blank_statContext ctx);
	/**
	 * Visit a parse tree produced by the {@code array_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArray_newbody(ProgramParser.Array_newbodyContext ctx);
	/**
	 * Visit a parse tree produced by the {@code class_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClass_newbody(ProgramParser.Class_newbodyContext ctx);
	/**
	 * Visit a parse tree produced by the {@code builtin_type_newbody}
	 * labeled alternative in {@link ProgramParser#new_body}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBuiltin_type_newbody(ProgramParser.Builtin_type_newbodyContext ctx);
	/**
	 * Visit a parse tree produced by {@link ProgramParser#forbody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForbody(ProgramParser.ForbodyContext ctx);
}