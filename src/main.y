%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%union
{
  int val_int;
  float val_float;
};

%token INT FLT INV EOL
%type <val_int> INT
%type <val_float> FLT

%%

NUMBER: NUMBER NUM EOL
|
;

NUM: INT {printf("esse numero %d eh valido\n", $<val_int>1);
   $<val_int>$ = $<val_int>1;}
| FLT {printf("esse numero %.6f eh valido\n", $<val_float>1);
   $<val_float>$ = $<val_float>1;}
| INV {printf("esse token eh invalido\n");}
;

%%

void yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}

int main(){
    yyparse();
    return 0;
}
