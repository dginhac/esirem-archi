; TD1 - Ex 3

SECTION INTVEC

B main

SECTION CODE

main 

LDR R0, v1
LDR R1, v2

ADD R5, R0, R1
SUB R6, R0, R1
SUB R7, R1, R0


fin
B fin

SECTION DATA

; Valeurs stockées en mémoire

v1 ASSIGN32 0x1337
v2 ASSIGN32 0xFD
