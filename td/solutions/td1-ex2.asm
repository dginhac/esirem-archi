; TD1 - Ex 2

SECTION INTVEC

B main

SECTION CODE

main

LDR R0, v1
LDR R1, v2

fin
B fin

SECTION DATA

; Valeurs stockées en mémoire

resultat1 ALLOC32 2
v1 ASSIGN8 0x42
resultat2 ALLOC16 1
v2 ASSIGN16 0x1337
resultat3 ALLOC8 1
v3 ASSIGN32 0x12345678
