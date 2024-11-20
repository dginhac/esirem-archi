SECTION INTVEC

B main

SECTION CODE

main
LDR SP, =maPile
ADD SP, SP, #40

; valeurs de test: essayons de calculer 5! (5 x 4 x 3 x 2 x 1)
MOV R0, #5

; appel de la fonction Factorielle
BL factorielle

fin
B fin

; Fonction factorielle
; Parametre : R0
; Resultat : R1
factorielle
PUSH {R0}
MOV R1, #1
factorielle_boucle
CMP R0, #0
BEQ fin_factorielle
MUL R1, R1, R0
SUB R0, R0, #1
B factorielle_boucle
fin_factorielle
POP {R0}
BX LR


SECTION DATA
maPile ALLOC32 10
