SECTION INTVEC

B main

SECTION CODE

main
LDR SP, =maPile
ADD SP, SP, #40

; valeurs de test:
MOV R0, #4
MOV R1, #5

BL addsous
MOV R2, R0

B fin

; fonction addition R0 <- R0 + R1
addition
PUSH {LR}
ADD R0, R0, R1
POP {LR}
BX LR

; fonction soustraction R0 <- R0 - R1
soustraction
PUSH {LR}
SUB R0, R0, R1
POP {LR}
BX LR

; fonction de test qui fait appel à addition et à soustraction
; 
addsous
PUSH {LR}
; R0 <- R0 + R1
BL addition
; R0 <- R0 - R1 = R0 + R1 - R1 = R0
BL soustraction
POP {LR}
BX LR

fin
B fin

SECTION DATA
maPile ALLOC32 10

