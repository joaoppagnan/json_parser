%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

DEC [0-9]
ALF [a-zA-Z]
ALFANUM [a-zA-Z0-9]

%%

{DEC}+ {
    return DIG;
}

[.] {
    return DOT;
}

[-] {
    return MIN;
}

{ALFANUM}+ {
    return MSG;
}

\[ {
    return COL_OP;
}

\] {
    return COL_CL;
}

\{ {
    return CHA_OP;
}

\} {
    return CHA_CL;
}

[:] {
    return DOPO;
}

["] {
    return ASP;
}

[,] {
    return COM;
}

[\n]+ ;

. ;

%%

int yywrap() {
  return 1;
}
/* {DEC}+\; ; */
