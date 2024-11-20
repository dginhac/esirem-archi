; TD1 - Ex 0

SECTION INTVEC

B main

SECTION CODE

main

MOV R0, #0x1000
LDR R1, [R0]      
ADD R0, R0, #4
LDR R2, [R0] 


fin 
B fin

SECTION DATA

; Valeurs stockées en mémoire
premiereValeur ASSIGN32 0x11
deuxiemeValeur ASSIGN32 0x21
troisiemeValeur ASSIGN32 0x32
quatriemeValeur ASSIGN32 0x32


