SECTION INTVEC

B main

SECTION CODE

main    


LDR R0, =val1
LDR R1, [R0], #4
LDR R2, [R0], #4
LDR R3, [R0], #4
LDR R4, [R0], #4

; Modification de ADD R6, R2, R1 en ADD R8, R2, R1

MOV R0, #0xa4
LDR R10, [R0]
ADD R10, R10, #0x2000
STR R10, [R0]

ADD R6, R2, R1

; Modification de ADD R7, R4, R3 en ADD R7, R1, R2

MOV R0, #0xbc
LDR R11, [R0]
SUB R11, R11, #0x1
SUB R11, R11, #0x10000
STR R11, [R0]

ADD R7, R4, R3



fin
B fin

SECTION DATA

val1 ASSIGN32 0x10
val2 ASSIGN32 0x20
val3 ASSIGN32 0x30
val4 ASSIGN32 0x40


