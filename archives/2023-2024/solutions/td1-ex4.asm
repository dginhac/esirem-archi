; TD1 - Ex 4

SECTION INTVEC

B main

SECTION CODE

main 

; Acces direct via les variables
LDR R0, v1
LDR R1, v2

; Addition et Soustractions
ADD R5, R0, R1
SUB R6, R0, R1
SUB R7, R1, R0


; Stockage des 2 resultats en utilisant ADD 
; pour se deplacer dans le tableau de resultats
LDR R10, =resultats
STR R5, [R10]
ADD R10, R10, #0x04 
STR R6, [R10]
ADD R10, R10, #0x04 
STR R7, [R10]

; Stockage des 2 resultats en utilisant R10 
; et un décalage de multiples de 4 octets
; R10 toujours égal à l'adresse de resultats
LDR R10, =resultats
STR R5, [R10]
STR R6, [R10, #0x04]
STR R7, [R10, #0x08]

; Stockage des 2 resultats en utilisant directement
; l'incrementation dans l'instruction STR
; R10 est incrémenté de 4 octets à chaque instruction STR
; équivalent à un ptr++ en langage C

LDR R10, =resultats
STR R5, [R10], #0x04
STR R6, [R10], #0x04
STR R7, [R10], #0x04

fin
B fin

SECTION DATA

; Valeurs stockées en mémoire
v1 ASSIGN32 0x1337
v2 ASSIGN32 0xFD
resultats ALLOC32 3


