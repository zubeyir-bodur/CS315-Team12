all: runParser deleteFiles

runParser: runYacc
	gcc -o glide y.tab.c 
	./glide < group12-test.txt

runYacc: runLex
	yacc cs315-team12.yacc.y

runLex:
	lex cs315-team12.lex.l

deleteFiles:
	-rm -f lex.yy.c *.tab.* glide *.output