; TD1 - Ex 9

SECTION INTVEC

B main


SECTION CODE

main

LDR R0, =val1
LDR R1, [R0], #4
LDR R2, [R0], #4
LDR R3, [R0], #4
LDR R4, [R0], #4

ADD R6, R2, R1
ADD R7, R4, R3

fin
B fin

SECTION DATA

val1 ASSIGN32 0x10
val2 ASSIGN32 0x20
val3 ASSIGN32 0x30
val4 ASSIGN32 0x40