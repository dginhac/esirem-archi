SECTION INTVEC

B main



SECTION CODE

main
;R0 = 0x8000
LDR R0, valeur

; décalage de 1 bit vers la droite = division par 2^1 = 2
; équivalent à MOV R1, R0, LSR #1
; R1 <- 0x4000
LSR R1, R0, #1

; décalage de 4 bits vers la droite = division par 2^4 = 16
; R1 <- 0x800
LSR R2, R0, #4

; décalage de 7 bits vers la droite = division par 2^7 = 128
; R1 <- 0x100
LSR R3, R0, #7

; décalage de 9 bits vers la droite = division par 2^9 = 512
; R1 <- 0x40
LSR R4, R0, #9

; décalage de 1 bits vers la gauche = multiplication par 2^1 = 2
; R1 <- 0x10000
LSL R5, R0, #1

; décalage de 7 bits vers la gauche = multiplication par 2^7 = 128
; R1 <- 0x400000
LSL R6, R0, #7

; décalage de 4 bits vers la gauche = multiplication par 2^4 = 16
; R1 <- 0x80000
LSL R7, R0, #4

; décalage de 9 bits vers la gauche = multiplication par 2^9 = 512
; R1 <- 1000000
LSL R8, R0, #9

fin 
B fin

SECTION DATA

valeur ASSIGN32 0x00008000
