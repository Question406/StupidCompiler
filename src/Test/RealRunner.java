package Test;

import AST.ASTNode;
import AST.ProgramNode;
import FrontEnd.ASTBuilder;
import FrontEnd.IRBuilder;
import FrontEnd.Parser.ProgramLexer;
import FrontEnd.Parser.ProgramParser;
import FrontEnd.Semantic.SemanticAnalyzer;
import IR.IRPrinter;
import IR.Interpreter.IRInterpreter;
import Optim.*;
import Test.AST.ASTPrinter;
import Utils.ErrorHandler;
import Utils.ProgramErrorListener;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintStream;

/*
    HIGHLIGHT:  remember in ProgramLexer add this method
                @Override
                public void notifyListeners(LexerNoViableAltException e) {
                    throw new SyntaxException("token error");
                }
 */

public class RealRunner {
    static int good = 0;
    static int fail = 0;
    ProgramLexer lexer;
    CommonTokenStream tokens;
    ProgramParser parser;
    ParseTree tree;
    ASTBuilder astbuilder;
    ASTNode root;
    SemanticAnalyzer analyzer;
    IRBuilder irBuilder;

    ASTPrinter astprinter;

    IR.Module IRRoot;

    // frontEnd
    private void BuildSyntax(String inputFile) throws Exception {
        InputStream is = System.in;

        if (inputFile != null) is = new FileInputStream(inputFile);
        CharStream input = CharStreams.fromStream(is);
        lexer = new ProgramLexer(input);
        tokens = new CommonTokenStream(lexer);
        parser = new ProgramParser(tokens);
        parser.removeErrorListeners();
        parser.addErrorListener(new ProgramErrorListener());
        tree = parser.program(); // parse
    }

    private void BuildAST() throws Exception {
        astbuilder = new ASTBuilder();
        root = (ProgramNode) astbuilder.visit(tree);
    }

    private void SemanticAnalyze() throws Exception{
        analyzer = new SemanticAnalyzer(new ErrorHandler());
        analyzer.visit((ProgramNode) root);
    }

    private void PrintAST() throws Exception {
        astprinter = new ASTPrinter();
        astprinter.visit((ProgramNode) root);
    }

    private void BuildIR() throws Exception {
        irBuilder = new IRBuilder();
        irBuilder.visit((ProgramNode) root);
        IRRoot = irBuilder.getIRRoot();
    }

    private void PrintIR(boolean inFile) throws Exception {
//        File file = new File("//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//ir_out.txt");
        File file = new File("ir_out.txt");
        PrintStream out = (inFile) ? new PrintStream(file) : System.out;
        IRPrinter irPrinter = new IRPrinter(out);
        irPrinter.visit(IRRoot);
    }


    // backend:
    private void SSAConstruct() throws Exception {
        DominaceTreeBuilder dominaceTreeBuilder = new DominaceTreeBuilder(IRRoot);
        dominaceTreeBuilder.run();
        SSAConstructor ssaConstructor = new SSAConstructor(IRRoot);
        ssaConstructor.run();
    }

    private void CFGSimplify() throws Exception {
        CFGSimplifier cfgSimplifier = new CFGSimplifier(IRRoot);
        cfgSimplifier.run();
    }

    private void FuncInline() throws Exception {
        FuncInliner funcInliner = new FuncInliner(IRRoot);
        funcInliner.run();
    }

    private void GlobalVarResolve() throws Exception {
        GlobalVarResolver globalVarResolver = new GlobalVarResolver(IRRoot);
        globalVarResolver.run();
    }

    private void Optimize() throws Exception {
        DominaceTreeBuilder dominaceTreeBuilder = new DominaceTreeBuilder(IRRoot);
        SSAConstructor ssaConstructor = new SSAConstructor(IRRoot);
        SCCP SCCPAnalyzer = new SCCP(IRRoot);
        DeadCodeElim deadCodeElim = new DeadCodeElim(IRRoot);
        CFGSimplifier cfgSimplifier = new CFGSimplifier(IRRoot);
        dominaceTreeBuilder.run();
        ssaConstructor.run();

//        PrintIR(false);

        boolean changed = true;
        while (changed) {
            changed = false;
            changed |= SCCPAnalyzer.run();
            changed |= cfgSimplifier.run();
            PrintIR(true);
            dominaceTreeBuilder.run();
            changed |= deadCodeElim.run();
            changed |= cfgSimplifier.run();
            PrintIR(true);
        }
    }

    public void run() throws Exception {
        String inputFile = "test.c";
        BuildSyntax(inputFile);
        BuildAST();
        SemanticAnalyze();
        BuildIR();
        FuncInline();
        GlobalVarResolve(); // highlight: must do
        CFGSimplify();
        Optimize();

        PrintIR(true);
        InputStream in = new FileInputStream("ir_out.txt");
//        IRInterpreter.main("ir_out.txt", System.out, new FileInputStream("in.txt"), false);
        IRInterpreter.main("ir_out.txt", System.out, new FileInputStream("in.txt"), true);
    }
}