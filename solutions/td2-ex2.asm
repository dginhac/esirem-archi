SECTION INTVEC

B main

SECTION CODE

; si R1 est négatif, placez le résultat de R0 + R1 dans R2;
; si R1 est positif, placez le résultat de R0 - R1 dans R2;
; si R1 est égal à 0, place R0 dans R2.

; à tester avec une valeur de R1 < 0, R1 = 0 et R1 > 0
MOV R1, #0x42

main
CMP R1, #0x00
; LT : <0
ADDLT R2, R0, R1
; GT : >0
SUBGT R2, R0, R1
; EQ : =0
MOVEQ R2, R0

fin
B fin

SECTION DATA
