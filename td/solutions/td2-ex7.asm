SECTION INTVEC

B main

SECTION CODE

main
; Plaçons des valeurs dans R1 et R2
MOV R1, #10
MOV R2, #1

BL valAbsolue
MOV R10, R0

; fonction valAbsolue
; 2 parametres : R1, R2
; 1 resultat : R0
valAbsolue
CMP R1, R2         ; calcule R1 - R2, change les drapeaux
SUBGT R0, R1, R2   ; si R1 > R2, R0 = R1 - R2
SUBLE R0, R2, R1   ; si R1 <= R2, R0 = R2 - R1
BX LR
  
fin
B fin

SECTION DATA

