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

OBJECT: CHA_OP OBJ CHA_CL
;

OBJ: COMMA STRING DOPO VAL OBJ
|
;

ARRAY: COL_OP ARY COL_CL
;

ARY: COMMA VAL ARY
|
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

COMMA: COM
|
;

%%

void yyerror(char *s){
  printf("INVALIDO\n");
  /* fprintf(stderr, "%s\n", s); */
}

int main(){
  yyparse();
  return 0;
}
