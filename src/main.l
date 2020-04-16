%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return DIG;
}

[.] {
    yylval = yytext;
    return PTO;
}

\n {
    return EOL;
}

[ \t]+ ;

. {
    yyerror("Token nao reconhecido!\n");
}

%%

int yywrap() {
  return 1;
}
