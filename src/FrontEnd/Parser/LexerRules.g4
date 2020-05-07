lexer grammar LexerRules;

INT : 'int';
BOOL : 'bool';
STRING : 'string';

NULL : 'null';
VOID : 'void';

// bool constant
Bool_constant : TRUE | FALSE;
TRUE : 'true';
FALSE : 'false';

// if
IF : 'if';
ELSE : 'else';

// loop
FOR : 'for';
WHILE : 'while';
BREAK : 'break';
CONTINUE : 'continue';

// return
RETURN:'return';

// pointer
NEW : 'new';

// class
CLASS : 'class';
THIS : 'this';

// identifier in C
ID : [a-zA-Z] [a-zA-Z_0-9]*;

// integer in C
INTEGER :    [1-9] [0-9]*
            | '0';

// string in C
STR_constant :  '"' (~["\\\r\n] | '\\' ["n\\])* '"'; //'"' (.)*? '"';

LINE_COMMENT: '//' .*?  ('\r' | '\n') ->skip;
COMMENT: '/*' .*? '*/' ->skip;
WS : [ \t\r\n\u000C]+ -> skip;