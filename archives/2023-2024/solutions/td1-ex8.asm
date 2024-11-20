; Td1 - ex 8

SECTION INTVEC

B main

SECTION CODE

main

; Chargeons l'adresse de source
LDR R0, =source

; Chargeons l'adresse de destination
LDR R1, =destination
ADD R1, R1, #12

; Copions les éléments uns à uns

LDR R2, [R0], #4
STR R2, [R1], #-4

LDR R2, [R0], #4
STR R2, [R1], #-4

LDR R2, [R0], #4
STR R2, [R1], #-4

LDR R2, [R0], #4
STR R2, [R1], #-4

; Hmm... il me semble que ça serait plus simple de faire
; une boucle...

fin
B fin

SECTION DATA

source ASSIGN32 0x48, 0x65, 0x6C, 0xFD
destination ALLOC32 4

