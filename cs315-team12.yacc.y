%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}
%token COMMENT ;
%token INT_LITERAL ;
%token DOUBLE_LITERAL ;
%token BOOL_LITERAL ;
%token STRING_LITERAL ;
%token INT_TYPE ;
%token DOUBLE_TYPE ;
%token BOOL_TYPE ;
%token STRING_TYPE ;
%token LP ;
%token RP ;
%token COMMA ;
%token END_STM ;
%token FOR ;
%token WHILE ;
%token IF ;
%token ELSE ;
%token ASSIGN_OP ;
%token OR_OP ;
%token AND_OP ;
%token EQ_OP ;
%token NEQ_OP ;
%token LT_OP ;
%token LE_OP ;
%token GT_OP ;
%token GE_OP ;
%token ADD_OP ;
%token SUB_OP ;
%token MULT_OP ;
%token DIV_OP ;
%token MOD_OP ;
%token INCR_OP ;
%token DECR_OP ;
%token PRINT ;
%token INPUT ;
%token MAIN ;
%token ASCEND_FUNC ;
%token DESCEND_FUNC ;
%token INCL_FUNC ;
%token ALTITUDE_FUNC ;
%token TEMPERATURE_FUNC ;
%token ACCELERATION_FUNC ;
%token CAMERA_FUNC ;
%token PHOTO_FUNC ;
%token TIME_FUNC ;
%token CONNECT_FUNC ;
%token LB ;
%token RB ;
%token IDENTIFIER ;

%start program

%nonassoc ASSIGN_OP ;

%left  OR_OP ;
%left  AND_OP ;
%left  EQ_OP ;
%left  NEQ_OP ;
%left  LT_OP ;
%left  LE_OP ;
%left GT_OP ;
%left GE_OP ;
%left ADD_OP ;
%left SUB_OP ;
%left MULT_OP ;
%left DIV_OP ;
%left MOD_OP ;
%right INCR_OP ;
%right DECR_OP ;

%%

program: main

main: MAIN LP RP LB statements RB

statements:	statement|statements statement

statement: statement_list END_STM | comment_line | if_stm | iteration_stm | function_declaration

statement_list:	expression_stm | compound_stm | print_statement | input_statement |function_call
			| predefined | declaration_statement
			
comment_line: COMMENT
			
expression_stm: expression

expression: assignment_expr

assignment_expr: IDENTIFIER ASSIGN_OP logical_expr
				| type IDENTIFIER ASSIGN_OP logical_expr

logical_expr: logical_expr OR_OP and_expr 
				| and_expr 
				
and_expr: and_expr AND_OP equality_expr
			| equality_expr
			
equality_expr: equality_expr EQ_OP relational_exp
			| equality_expr NEQ_OP relational_exp
			| relational_exp
			
relational_exp: relational_exp LT_OP additive_expr
			| relational_exp GT_OP additive_expr
			| relational_exp LE_OP additive_expr
			| relational_exp GE_OP additive_expr
			| additive_expr

additive_expr: additive_expr ADD_OP multiplicative_expr
			| additive_expr SUB_OP multiplicative_expr
			| multiplicative_expr
			
multiplicative_expr: multiplicative_expr MULT_OP prefix_expr
			| multiplicative_expr DIV_OP prefix_expr
			| multiplicative_expr MOD_OP prefix_expr
			| prefix_expr

prefix_expr: postfix_expr
			| INCR_OP prefix_expr
			| DECR_OP prefix_expr

postfix_expr: primary_expr
			| postfix_expr INCR_OP
			| postfix_expr DECR_OP
			
primary_expr: LP logical_expr RP
			| IDENTIFIER
			| literal
			| function_call
			| predefined
			
literal: INT_LITERAL | DOUBLE_LITERAL | BOOL_LITERAL | STRING_LITERAL

compound_stm: LB statements RB

if_stm: if_alone | if_else

if_else: if_alone ELSE LB statements RB

if_alone: IF LP logical_expr RP LB statements RB

iteration_stm : for_stm | while_stm

for_stm: FOR LP assignment_expr END_STM logical_expr END_STM assignment_expr RP LB statements RB

while_stm: WHILE LP logical_expr RP LB statements RB

print_statement: PRINT LP outputs RP

outputs: output | outputs output 

output: literal | function_call | predefined | IDENTIFIER

input_statement: INPUT LP user_prompt RP

user_prompt: STRING_LITERAL | IDENTIFIER

function_call: IDENTIFIER LP argument_list RP | IDENTIFIER LP RP

argument_list: literal | IDENTIFIER | literal COMMA argument_list
			| IDENTIFIER COMMA argument_list

function_declaration: type IDENTIFIER LP parameter_list RP LB function_body RB
					| type IDENTIFIER LP RP LB function_body RB
					
parameter_list: parameter | parameter_list COMMA parameter

parameter: type IDENTIFIER

function_body: statement | function_body statement
	
predefined: INCL_FUNC | ASCEND_FUNC | DESCEND_FUNC | TEMPERATURE_FUNC | ALTITUDE_FUNC | ACCELERATION_FUNC
			| CAMERA_FUNC | PHOTO_FUNC | TIME_FUNC | CONNECT_FUNC
			
declaration_statement: type identifiers 

identifiers: IDENTIFIER | IDENTIFIER COMMA IDENTIFIER

type: INT_TYPE | DOUBLE_TYPE | BOOL_TYPE | STRING_TYPE

%%

#include "lex.yy.c"

void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}
int main(void){
 yyparse();
if(yynerrs < 1){
		printf("Parsing is successful. \n");
	}
 return 0;
}
