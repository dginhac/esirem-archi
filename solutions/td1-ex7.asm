SECTION INTVEC

B main

SECTION CODE

main

; Adresse de source 
; R0 <- 0x1000
LDR R0, =source

; Adresse de destination
; R1 <- 0x1010
LDR R1, =dest

; Copie du premier element en faisant les opérations suivantes :
; 1 - Chargement de [R0] dans R2 : R2 <- 0x48
; 2 - Post incrementation de R0 : R0 <- RO + #4 = 0x1004
; 3 - Stockage de R2 dans [R1] : 0x48 à l'adresse 0x1010
; 4 - Post incrementation de R1 : R1 <- R1 + #4 = 0x1014
; Les 2 post incrementations permettent de passer à l'élément suivant
; pour le tableau source pointé par R0 et pour le tableau destination pointé par R1
LDR R2, [R0], #4
STR R2, [R1], #4

; on réitère pour les 3 autres éléments.
LDR R2, [R0], #4
STR R2, [R1], #4

LDR R2, [R0], #4
STR R2, [R1], #4

LDR R2, [R0], #4
STR R2, [R1], #4

; Avec une boucle

; charge un compteur initialisé au nombre d'itérations
MOV R10, #4
LDR R11, =source
LDR R12, =destboucle

boucle
CMP R10, #0
BEQ fin
LDR R2, [R11], #4
STR R2, [R12], #4
SUB R10, R10, #1
B boucle
fin 
B fin

SECTION DATA

source ASSIGN32 0x48, 0x65, 0x6C, 0xFD
dest ALLOC32 4
destboucle ALLOC32 4

