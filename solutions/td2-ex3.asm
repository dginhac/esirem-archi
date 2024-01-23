SECTION INTVEC

B main

SECTION CODE

main
; valeurs de test pour R1 et R2 -- modifiez-les!
MOV R0, #2
MOV R1, #-1


; comparaison -- mets à jour les drapeaux de l'ALU
CMP R1, #0x00

; saute au bon endroit en fonction du résultat de la comparaison
BLT negatif
BGT positif
BEQ nul

negatif ; que faire si R1 est (strictement) négatif
ADD R2, R0, R1
B fin

positif ; que faire si R1 est (strictement) positif)
SUB R2, R0, R1
B fin

nul     ; que faire si R1 est égal à 0
MOV R2, R0

fin
B fin

SECTION DATA
