SECTION INTVEC

B main

SECTION CODE

main

; Mise en place d'une pile de 10 mots, soit 40 octets
; Le principe d'une pile est LIFO (Last in First Out)
LDR SP, =maPile
; On se met toujours à l'adresse la plus haute de la pile
ADD SP, SP, #40


; Initialisons les registres à utiliser par la fonction nommée Triple
MOV R0, #0x08
MOV R1, #0x03

; Appelons notre fonction
BL Triple
; on met le resultat de la fonction dans R2
MOV R2, R0
; et on compare ce résultat avec R1
CMP R1, R2

B fin

; Fonction qui triple la valeur passée dans R0
; paramètre : R0
; resultat : R0
Triple
PUSH {R1}
; R1 <- R0 + R0 
ADD R1, R0, R0
; R1 <- R0 + R1 = R0 + R0 + R0 = 3*R0
ADD R1, R1, R0
; R0 <- 3xR0
MOV R0, R1
POP {R1}
BX LR
  
fin
B fin

SECTION DATA
; Attention de bien allouer le meme nombre de mots que ce qui est défini pour SP
maPile ALLOC32 10;


