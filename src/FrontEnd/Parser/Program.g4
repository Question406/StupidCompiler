// main grammar
grammar Program;

//import Keyword;
import LexerRules;

// type
builtin_type :    INT
                | BOOL
                | STRING
                ;

program : def*;

def : (classdef ';'?)| funcdef | (vardef ';');

formalpara : type ID;
formalparas: formalpara? (',' formalpara)*;

block : '{' stat* '}';

funcdef: type_or_void ID '(' formalparas ')' block;

vardef: type vardec (',' vardec)*;

constructor_def : ID '(' formalparas ')' block;

vardec : ID ('=' expr)?;

classtype : ID;

classdef : CLASS ID classbody;

classbody : '{' (vardef ';' | constructor_def | funcdef )* '}';

type : (classtype | builtin_type)                          # var_type
     | ((classtype | builtin_type) ('[' ']')+)             # array_type
;


type_or_void : type | VOID;

expr
    : expr op ='.' ID                                       # member_expr
    | array = expr '[' index = expr ']'                     # index_expr
    | expr '(' exprList? ')'                                # method_expr
    | expr op = ('++' | '--')                               # postfix_expr
    | op = ('+' | '-' | '++' | '--') expr                   # prefix_expr
    | op = ('~' | '!') expr                                 # prefix_expr
    | lhs = expr op = ('*' | '/' | '%')         rhs = expr  # binary_expr
    | lhs = expr op = ('+' | '-')               rhs = expr  # binary_expr
    | lhs = expr op = ('<<' | '>>')             rhs = expr  # binary_expr
    | lhs = expr op = ('<=' | '>=' | '>' | '<') rhs = expr  # binary_expr
    | lhs = expr op = ('==' | '!=')             rhs = expr  # binary_expr
    | lhs = expr op = '&'                       rhs = expr  # binary_expr
    | lhs = expr op = '^'                       rhs = expr  # binary_expr
    | lhs = expr op = '|'                       rhs = expr  # binary_expr
    | lhs = expr op = '&&'                      rhs = expr  # binary_expr
    | lhs = expr op = '||'                      rhs = expr  # binary_expr
    | <assoc = right> lhs = expr op = '=' rhs = expr        # assign_expr
    | '(' expr ')'                                          # sub_expr
    | THIS                                                  # this_expr
    | constants                                             # constants_expr
    | ID                                                    # ID_expr
    | NEW new_body                                          # new_expr
;

exprList : expr (',' expr)* ; // arg list

constants : INTEGER | Bool_constant | NULL | STR_constant;

stat :    block                                      # block_stat
        | IF '(' cond = expr ')' stat (ELSE stat)?   # if_stat
        | FOR '(' forbody ')' stat?                  # for_stat
        | WHILE '(' cond = expr ')' stat?            # while_stat
        | BREAK ';'                                  # break_stat
        | CONTINUE ';'                               # continue_stat
        | RETURN ret = expr? ';'                     # return_stat
        | vardef ';'                                 # vardef_stat
        | expr ';'                                   # expr_stat
        | ';'                                        # blank_stat
        ;

new_body :    //(classtype | builtin_type) ('[' ']')+ ('[' expr ']')+     # error_array_newbody
//              (classtype | builtin_type) ('[' init = expr? ']')+                        # array_newbody
            //| (classtype | builtin_type) ((('[' expr ']')+ ('[' ']')*) | ('[' ']')+)    # array_newbody
              (classtype | builtin_type) ('[' expr? ']')+                               # array_newbody
            | classtype ('(' para = exprList? ')')?                                     # class_newbody
            | builtin_type                                                              # builtin_type_newbody
            ;

forbody : (for_initVarDef = vardef || for_initExpr = expr) ';' for_endexpr = expr? ';' for_update = expr?;