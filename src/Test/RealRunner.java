package Test;

import AST.ASTNode;
import AST.ProgramNode;
import IR.Interpreter.IRInterpreter;
import Optim.CFGSimplifier;
import Optim.SSAConstructor;
import FrontEnd.*;
import FrontEnd.Semantic.SemanticAnalyzer;
import IR.IRPrinter;
import Test.AST.ASTPrinter;
import Utils.ErrorHandler;
import Utils.ProgramErrorListener;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

import FrontEnd.Parser.*;

import static Utils.StringOutputColors.*;

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
        ANTLRInputStream input = new ANTLRInputStream(is);
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

    private void PrintIR() throws Exception {
        File file = new File("//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//ir_out.txt");
        PrintStream out = new PrintStream(file);
        IRPrinter irPrinter = new IRPrinter(out);
        irPrinter.visit(IRRoot);
    }


    // backend:

    private void SSAConstruct() throws Exception {
        SSAConstructor ssaConstructor = new SSAConstructor(IRRoot);
        ssaConstructor.run();
    }

    private void CFGSimplify() throws Exception {
        CFGSimplifier cfgSimplifier = new CFGSimplifier(IRRoot);
        cfgSimplifier.run();
    }

    public void run() throws Exception {
        String inputFile = "//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//test.c";
        BuildSyntax(inputFile);
        BuildAST();
        SemanticAnalyze();
        BuildIR();

        CFGSimplify();
        PrintIR();

        InputStream in = new FileInputStream("//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//ir_out.txt");
        IRInterpreter vm = new IRInterpreter(in, false, new DataInputStream(System.in), new PrintStream(System.out));
        vm.run();
        System.exit((int) vm.getExitcode());
    }






    /*
      ----------------an exciting split line--------------------------
    */

    private void run(String inputFile) throws Exception{
        BuildSyntax(inputFile);
        BuildAST();
        SemanticAnalyze();
        BuildIR();
//        PrintIR();
        PrintIRAll(inputFile);
    }

    private void PrintIRAll(String inputFile) throws Exception {
        var split = inputFile.split("/");
        String v = split[split.length - 1];
        File file = new File("//home//jiyi//IdeaProjects//StupidCompiler_v1//src//for_test//IR_ALL//" + v  + ".ir");
        PrintStream out = new PrintStream(file);
        IRPrinter irPrinter = new IRPrinter(out);
        irPrinter.visit(IRRoot);
    }

    // test all test.mx in rootDir
    public void runAll() {
        good = 0;
        fail = 0;
        String rootDir = "//home//jiyi//Documents//Mx//Compiler-2020-testcases-master//codegen";
        File rootFile = new File(rootDir);
        recursiveIRRunAll(rootFile);
        System.out.println("good: " + good + " fail: " + fail + " good ratio: " + (double) good / (good + fail));
    }

    public void recursiveRunAll(File currentFile) {
        for (String filename : currentFile.list()) {
            File file = new File(currentFile, filename);
            String path = Paths.get(file.getAbsolutePath()).toString();
            if (file.isDirectory())
                recursiveRunAll(file);
            else {
                if (! path.contains(".mx"))
                    continue;
                // test filename.mx
                System.out.println(ANSI_BLUE + " processing " + path);
                String data = null;
                try{
                     data = new String(Files.readAllBytes(Paths.get(file.getAbsolutePath())));
                } catch (Exception e) {
                    System.out.print("file read Exception " + e);
                }
                boolean expectSemanticRes = true;
                if (data.contains("Fail"))
                    expectSemanticRes = false;
                else if (data.contains("Success"))
                    expectSemanticRes = true;
                else {
                    System.out.print("unkown error at " + path);
                    Scanner in = new Scanner(System.in);
                    int num = in.nextInt();
                }

                // SemanticAnalyze
                boolean realRes = true;
                try {
                    run(path);
                } catch (Exception e) {
                    realRes = false;
                    System.out.println(ANSI_BLUE + "error msg: ");
                    System.out.println(e);
                }
                if (realRes == expectSemanticRes) {
                    System.out.println(ANSI_GREEN + path + " " + " good");
                    good++;
                }
                else {
                    System.out.println(ANSI_RED + path + " " + " fail");
                    fail++;
                }
                System.out.println(ANSI_RESET);
            }
        }
    }
    public void recursiveIRRunAll(File currentFile) {
        for (String filename : currentFile.list()) {
            File file = new File(currentFile, filename);
            String path = Paths.get(file.getAbsolutePath()).toString();
            if (file.isDirectory())
                recursiveRunAll(file);
            else {
                if (! path.contains(".mx"))
                    continue;
                // test filename.mx
                System.out.println(ANSI_BLUE + " processing " + path);
                String data = null;
                try{
                    data = new String(Files.readAllBytes(Paths.get(file.getAbsolutePath())));
                } catch (Exception e) {
                    System.out.print(ANSI_RED + "file read Exception " + e);
                }
                // SemanticAnalyze
                boolean realRes = true;
                try {
                    run(path);
                } catch (Exception e) {
                    realRes = false;
                    System.out.println(ANSI_RED + "error msg: ");
                    System.out.println(e);
                    fail++;
                }
                if (realRes)
                    good++;
                System.out.println(ANSI_RESET);
            }
        }
    }

    // highlight: for online judge

    public void SemanticTest() throws Exception {
        BuildSyntax(null);
        BuildAST();
        SemanticAnalyze();
    }
}
