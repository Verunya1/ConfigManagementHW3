grammar gyoo;

//files   :     file files | empty;
//file    :     group student subject;
//group   :    '(' '^' NAME names  ')';
//subject :    '(' title ')';
//student :    '(' '@' info infooo ')';
//title   :     NAME;
//
//FIRST_BRACKET   :   '(';
//LAST_BRACKET    :   ')';
////IGNORE          :   '\t';
////IGNORE_NEWLINE  :   '\n+';
//IGNORE_COMMENT  :   '#.*';
//NAME            :   [^ t#();'@]+;
//STRING          :   [^ :)(t']*;
//DIGIT           :   [0-9]+;
//GROUP           :   '^';
//STUDENT         :   '@';
//WS              :   [ \n\t]+ ->skip;

//INFO    : FIRST_BRACKET (MARK GROUP | DOG STUDENT | SUBJECT ) LAST_BRACKET;


FIRST_BRACKET   :   '(';
LAST_BRACKET :   ')';
fragment DIGIT : [0-9];
fragment GROUP_  :  '^';
fragment STUDENT_ :   '@';
fragment STRING  :   [^ :)(\t']*;
fragment NAME   :   [^ \t#();'@]+;
fragment IGNORE_COMMENT  :   '#.*';

GROUP : FIRST_BRACKET GROUP_ (NAME{4} '-' DIGIT{1,2} '-' DIGIT{2})+ LAST_BRACKET;
STUDENT : FIRST_BRACKET STUDENT_ (STRING) LAST_BRACKET;
SUBJECT : FIRST_BRACKET STRING LAST_BRACKET;

log : entry+ ;
entry : GROUP | STUDENT | SUBJECT;