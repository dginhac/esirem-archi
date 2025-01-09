SECTION INTVEC

B main

SECTION CODE

main
LDR SP, =maPile
ADD SP, SP, #40

; valeurs de test: essayons de calculer 4^5 
MOV R0, #4
MOV R1, #5

; appel de la fonction puissance
BL Puissance
; test qui verifie si le résultat est bien 0x400 (4^5)
ASSERT R0=0x400
B fin

Puissance
; paramètres: R0 = base, R1 = exposant 
; retourne:  R0 <= R0 ** R1  
; sauvegarde des valeurs des registres
PUSH {R1, R2} 
; cas spécial où l'exposant = 0, peu importe la base, le résultat est 1
CMP R1, #0
MOVEQ R0, #1
BEQ finPuissance
; on sauvegarde notre base dans R2 
MOV R2, R0
boucleP
; on décrémente R1 et on vérifie si on a terminé
SUBS R1, R1, #1 
BEQ finPuissance
MUL R0, R0, R2
B boucleP
finPuissance
POP {R1, R2}
BX LR

finfonction
BX LR



fin
B fin

SECTION DATA
maPile ALLOC32 10

