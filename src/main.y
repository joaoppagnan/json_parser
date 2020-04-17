%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token DIG MIN DOT ASP MSG COL_OP COL_CL CHA_OP CHA_CL DOPO COM

%%

INPUT: INPUT STRUCT {printf("VALIDO\n");}
|
;

STRUCT: OBJECT
| ARRAY
;

OBJECT: CHA_OP CHA_CL
| CHA_OP OBJ CHA_CL
;

OBJ: STRING DOPO VAL
| STRING DOPO VAL COM OBJ
;

ARRAY: COL_OP COL_CL
| COL_OP ARY COL_CL
;

ARY: VAL
| VAL COM ARY
;

VAL: STRING
| NUMBER
| STRUCT
;

STRING: ASP STR ASP
;

STR: MSG STR
| NUMBER STR
|
;

NUMBER: NUM
| MIN NUM
;

NUM: DIG
| DIG DOT NUM
;

%%

void yyerror(char *s){
  printf("INVALIDO\n");
}

int main(){
  yyparse();
  return 0;
}
