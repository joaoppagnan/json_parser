%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token DIG EOL PTO

%%

NUM: NUM DIG PTO DIG EOL {printf("esse numero %d%s%d eh valido\n", $2, $3, $4);}
| NUM DIG EOL {printf("esse numero %d eh valido\n", $2);}
|
;

%%

void yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}

int main(){
    yyparse();
    return 0;
}
