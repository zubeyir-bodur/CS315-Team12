%option main
digit   [0-9]
nonzero_digit [1-9]
sign    [+-]
comment "#"
lp "("
rp ")"
lb "{"
rb "}"
comma ","
end_stm ";"
for for
while while
if if
else else
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
assign_op [=(*=)(/=)(%=)(+=)(-=)(&=)(|=)]
print "print"
input "input"
altitude "getAltitude"
temperature "getTemp"
acceleration "getAcc"
camera "toggleCam"
photo "takePhoto"
timestamp "getTime"
connect "connect"
numeral  {nonzero_digit}{digit}*
integer {sign}?{numeral}*
double {sign}?{numaral}(\.)?{digit}+
boolean ["true""false"]
string \"(\\.|[^"\\])*\"
literal {integer}|{double}|{boolean}|{string}
lowercase_let [a-z]
uppercase_let [A-Z]
letter {lowercase_let}|{uppercase_let}
ident_chars {letter}|{digit}|"-"|"_"
identifier {letter}{ident_chars}*
sentence {identifier}*
%%
{comment} printf("COMMENT ");
{integer} printf("INT ");
{double} printf("DOUBLE ");
{boolean} printf("BOOL ");
{string} printf("STRING ");
{lp} printf("LP ");
{rp} printf("RP ");
{comma} printf("COMMA ");
{end_stm} printf("END_STM ");
{for} printf("FOR ");
{while} prinf("WHILE ");
{if} printf("IF ");
{else} printf("ELSE ");
{assign_op} printf("ASSIGN_OP ");
{or_op} printf("OR_OP ");
{and_op} printf("AND_OP ");
{eq_op} printf("EQ_OP ");
{neq_op} printf("NEQ_OP ");
{lt_op} printf("LT_OP ");
{le_op} printf("LE_OP ");
{gt_op} printf("GT_OP ");
{ge_op} printf("GE_OP ");
{add_op} printf("ADD_OP ");
{sub_op} printf("SUB_OP ");
{mult_op} printf("MULT_OP ");
{div_op} printf("DIV_OP ");
{mod_op} printf("MOD_OP ");
{incr_op} printf("INCR_OP ");
{decr_op} printf("DECR_OP ");
{print} printf("PRINT ");
{input} printf("INPUT ");
{altitude} printf("ALTITUDE_FUNC ");
{temperature} printf("TEMPERTAURE_FUNC ");
{acceleration} printf("ACCELERATION_FUNC ");
{camera} printf("CAMERA_FUNC ");
{photo} printf("PHOTO_FUNC ");
{timestamp} printf("TIME_FUNC ");
{connect} printf("CONNECT_FUNC ");
{lb} printf("LB ");
{rb} printf("RB ");
%%
