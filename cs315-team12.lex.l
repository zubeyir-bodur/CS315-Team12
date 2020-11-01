lp "("
rp ")"
lb "{"
rb "}"
comma ","
end_stm ";"
for "for"
while "while"
if "if"
else "else"
or_op "||"
and_op "&&"
eq_op "=="
neq_op "!="
lt_op "<"
le_op "<="
gt_op ">"
ge_op ">="
add_op "+"
sub_op "-"
mult_op "*"
div_op "/"
mod_op "%"
incr_op "++"
decr_op "--"
assign_op "="
print "print"
input "input"
main "main"
ascend "ascend"
descend "descend"
inclination "getInclination"
altitude "getAltitude"
temperature "getTemp"
acceleration "getAcc"
camera "toggleCam"
photo "takePhoto"
timestamp "getTime"
connect "connect"
sign [+-]
digit [0-9]
numeral {digit}+
true "true"
false "false"
int_literal {sign}?{numeral}+
double_literal {sign}?{numeral}(\.)?{digit}+
bool_literal {true}|{false}
string_literal \"(\\.|[^"\\])*\"
comment \#[^#]*\#
literal {int_literal}|{double_literal}|{bool_literal}|{string_literal}
type_int "int"
type_double "double"
type_bool "bool"
type_string "string"
type {type_int}|{type_double}|{type_bool}|{type_string}
lowercase_let [a-z]
uppercase_let [A-Z]
letter {lowercase_let}|{uppercase_let}
ident_chars {letter}|{digit}|"-"|"_"
identifier {letter}{ident_chars}*
%option yylineno
%%
{comment} return COMMENT;
{int_literal} return INT_LITERAL;
{double_literal} return DOUBLE_LITERAL;
{bool_literal} return BOOL_LITERAL;
{string_literal} return STRING_LITERAL;
{type_int} return INT_TYPE;
{type_double} return DOUBLE_TYPE;
{type_bool} return BOOL_TYPE;
{type_string} return STRING_TYPE;
{lp} return LP;
{rp} return RP;
{comma} return COMMA;
{end_stm} return END_STM;
{for} return FOR;
{while} return WHILE;
{if} return IF;
{else} return ELSE;
{assign_op} return ASSIGN_OP;
{or_op} return OR_OP;
{and_op} return AND_OP;
{eq_op} return EQ_OP;
{neq_op} return NEQ_OP;
{lt_op} return LT_OP;
{le_op} return LE_OP;
{gt_op} return GT_OP;
{ge_op} return GE_OP;
{add_op} return ADD_OP;
{sub_op} return SUB_OP;
{mult_op} return MULT_OP;
{div_op} return DIV_OP;
{mod_op} return MOD_OP;
{incr_op} return INCR_OP;
{decr_op} return DECR_OP;
{print} return PRINT;
{input} return INPUT;
{main} return MAIN;
{ascend} return ASCEND_FUNC;
{descend} return DESCEND_FUNC;
{inclination} return INCL_FUNC;
{altitude} return ALTITUDE_FUNC;
{temperature} return TEMPERATURE_FUNC;
{acceleration} return ACCELERATION_FUNC;
{camera} return CAMERA_FUNC;
{photo} return PHOTO_FUNC;
{timestamp} return TIME_FUNC;
{connect} return CONNECT_FUNC;
{lb} return LB;
{rb} return RB;
{identifier} return IDENTIFIER;
%%

int yywrap() { return 1; }

