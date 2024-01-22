SECTION INTVEC

B main


SECTION CODE

main

; R0 <- 0x1000
MOV R0, #0x1000
; ou
LDR R0, =tmp1

; R1 <- contenu de l'adresse pointée par R0 = 0x1000
; R1 <- 0XDE
LDR R1, [R0]

; R2 <- contenu de l'adresse pointée par R0+4 = 0x1000 + 0x04 = 0x1004
; R0 pas modifié = 0x1000
; R2 <-0x08
LDR R2, [R0, #4]

; R3 <- contenu de l'adresse pointée par R0 = 0x1000 
; puis incrémentation de R0 <- R0+4 donc R0 <- #0x1004
; R3 <- 0XDE
LDR R3, [R0], #4

; R4 <- contenu de l'adresse pointée par R0+R2 = 0x1004 + 0x08 = 0x100C
; R4 <- 0x1337
; RO et R2 pas modifiés
LDR R4, [R0, R2]

; R5 <- contenu de l'adresse pointée par RO+ (R2 décalé de 3bits vers la gauche)
; R0 = 0x1004
; R2 = 0x08 donc apres décalage on a 0x40
; R5 <- contenu de 0x1004 + 0x40 = 0x1044
; R5 <- 0x4D
LDR R5, [R0, R2, LSL #3]

; R6 <- contenu de l'adresse pointée par R0+R2 = 0x1004 + 0x02 = 0x1006
; Attention, on lit à partir du 6eme octet et on va récupérer un mot de 
; 4 octets constitué de 2 octets LSB du mot en 0x1004 et 
; de 2 octets MSB du mot en 0x1008
; RO = 0x1004 pas modifié
; 0x1006 : 0x00
; 0x1007 : 0x00
; 0x1008 ; 0x14
; 0x1009 : 0x30
; R6 <- 0x301400 (Stockage en Little Endian)
LDR R6, [R0, #2]

; R7 <- contenu de l'adresse pointée par RO+ (R2 décalé de 2bits vers la droites)
; R0 = 0x1004
; R2 = 0x08 donc apres décalage de 2 bits on a 2
; R7 <- contenu de 0x1004 + 2 donc
; R7 <- 0x301400 (Stockage en Little Endian)
LDR R7, [R0, R2, LSR #2]

fin
B fin

SECTION DATA

; Adresse 1000
tmp1 ASSIGN32 0xDE, 0x8, 0x314, 0x1337
; Adresse 1010
tmp2 ASSIGN32 0xCD, 0xA7, 0xE4, 0x357
; Adresse 1020
tmp3 ASSIGN32 0xBC, 0xB6, 0x1F, 0x17
; Adresse 1030
tmp4 ASSIGN32 0xAB, 0xC5, 0x4E, 0x138
; Adresse 1040
tmp5 ASSIGN32 0x9A, 0x4D, 0x54, 0x139

