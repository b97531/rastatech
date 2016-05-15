#

all: rastatech


rastatech: lex.yy.c rastatech.tab.c
	gcc -std=gnu99  lex.yy.c rastatech.tab.c -lfl -o rastatech
   

lex.yy.c: rastatech.l rastatech.tab.c
	flex rastatech.l

rastatech.tab.c: rastatech.y
	bison -d rastatech.y
  
clean:
	rm lex.yy.c rastatech  rastatech.tab.h  rastatech.tab.c
	
