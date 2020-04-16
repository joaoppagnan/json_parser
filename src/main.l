%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

DIG [0-9]
POS [1-9]
ALF [a-zA-Z]
ALFANUM [a-zA-Z0-9]

%%

-?0{DIG}+.*{DIG}* {
    return INV;
}

-?0 {
    yylval.val_int = atoi(yytext);
    return INT;
}

-?{POS}+{DIG}* {
    yylval.val_int = atoi(yytext);
    return INT;
}

-?{POS}+{DIG}*.{DIG}+ {
    yylval.val_float = atof(yytext);
    return FLT;
}

-?0.{DIG}+ {
    yylval.val_float = atof(yytext);
    return FLT;
}

\n {
    return EOL;
}

[ \t]+ ;

. {
    return INV;
}

%%

int yywrap() {
  return 1;
}
