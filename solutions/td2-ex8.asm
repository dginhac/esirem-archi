SECTION INTVEC

B main

SECTION CODE

main
; Préparons deux valeurs à multiplier, par exemple 2 et 5. 
MOV R1, #0x02
MOV R0, #0x05

; Appel de la fonction
BL Multiplication
MOV R10, R2
B fin

; Fonction multiplication (sans MUL)
; 2 entrees : R0, R1
; 1 resultat : R2
Multiplication
MOV R2, #0x00
boucle
CMP R1, #0x00
BEQ finfonction
ADD R2, R2, R0
SUB R1, R1, #0x01
B boucle

finfonction
BX LR

fin
B fin


SECTION DATA
maPile ALLOC32 10;
