%option main
digit   [0-9]
nonzero_digit [1-9]
sign    [+-]
comment "#"
lp "("
rp ")"
lb "{"
rb "}"
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
lowercase_let [a-z]
uppercase_let [A-Z]
letter {lowercase_let}|{uppercase_let}
ident_chars {letter}|{digit}|"-"|"_"
identifier {letter}{ident_chars}*
sentence {identifier}*
%%
{comment} printf("COMMENT ");
{integer} printf("INT ");
{lp} printf("LP ");
{rp} printf("RP ");
{print} printf("PRINT ");
{input} printf("INPUT ");
{altitude} printf("ALTITUDE_FUNC ");
{temperature} printf("TEMPERAURE_FUNC ");
{acceleration} printf("ACCELERATION_FUNC ");
{camera} printf("CAMERA_FUNC ");
{photo} printf("PHOTO_FUNC ");
{timestamp} printf("TIME_FUNC ");
{connect} printf("CONNECT_FUNC ");
{lb} printf("LB ");
{rb} printf("RB ");
%%
