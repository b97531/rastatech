/* just like Unix wc */

%{
#include "rastatech.tab.h"
%}

 /*.	printf("bad input character '%s' at line %d\n", yytext, yylineno); */
%%
  /* Rules comment */
([ \t]*)|(;.*)
^([ \t]*(\n|;.*\n))
R|r             { return RED; }
G|g             { return GREEN; }
B|b             { return BLUE; }
C|c             { return COLOR; }
D|d             { return DELAY; }
RAMP|ramp       { return RAMP; }
L|l             { return LOOP; }
E|e             { return ENDLOOP; }
SUB|sub         { return SUB; }
ENDSUB|endsub   { return ENDSUB; }
END|end         { return END; }
,               { return VIRG; }
[0-9]+	        { yylval = atoi(yytext); return NUMBER; }
\n              { return EOL; }
.	              { yyerror("Mystery character %c\n", *yytext); }
%%
