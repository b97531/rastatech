/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README file for license conditions and contact info.
 * $Header: /home/johnl/flnb/code/RCS/fb1-5.y,v 2.1 2009/11/08 02:53:18 johnl Exp $
 */

/* simplest version of calculator */

%{
#  include <stdio.h>
#include "rastatech.tab.h"
%}

/* declare tokens */
%token RED GREEN BLUE COLOR RAMP
%token DELAY
%token LOOP ENDLOOP
%token SUB ENDSUB
%token NUMBER
%token VIRG
%token EOL
%token END

%%
statement: /* nothing */
 | statement exp EOL { printf("= %d\n> ", $2); }
 | statement EOL { printf("> "); } /* blank line or a comment */
 ;

exp: RED VIRG NUMBER  { $$ = $3; }
 ;
%%
main()
{
  printf("> "); 
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
