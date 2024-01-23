SECTION INTVEC

B main

SECTION CODE
main

; -------------------------
; Version 1 avec une boucle simple parcourant les 6 éléments
; Non optimal car on teste le premier élément du tableau qui est déja
; stocké dans max

; RO = pointeur du tableau
LDR R0, =data
; on charge la première valeur dans le registre R3 qui stocke le max.
LDR R3, [R0]
; le cpt R1 commence à 0 et on incrémente jusqu'à 6 
MOV R1, #0x00
boucle
; On compare R1 avec 6
CMP R1, #6
; on sort de la boucle des qu'on a R1=6
BEQ fin
; on charge la valeur de data à l'indice R0 
; et on décale l'adresse sur la valeur suivante
LDR R2, [R0], #0x04
; On compare R2 avec le max déja stocké
CMP R2, R3
; Si R2 est plus grand que R3, 
; alors R2 est le nouveau max qu'on stocke dans R3
MOVGT R3, R2
; On incremente le compteur
ADD R1, R1, #1
; et on réitère sur l'élément suivant.
B boucle

; -------------------------
; Version 2 avec une boucle simple parcourant les 5 derniers éléments
; le premier est utilisé comme valeur maximale initiale

; RO = pointeur du tableau
LDR R0, =data
; on charge la première valeur dans le registre R3 qui stocke le max.
; et on decale R0 pour aller sur la valeur suivante car ce n'est plus
; nécessaire de traiter la première valeur
LDR R3, [R0], #0x04
; Comme on a déja traité la première valeur (indice 0),
; on peut initialiser le compteur à 1 et on incrémente jusqu'à 6
; C'est plus propre que d'initialiser le compteur à 0 et aller jusqu'à 5 
MOV R1, #0x01
; le reste de la boucle est identique à la version 1
boucle
CMP R1, #6
BEQ fin
LDR R2, [R0], #0x04
CMP R2, R3
MOVGT R3, R2
ADD R1, R1, #1
B boucle

; -------------------------
; Version 3 avec une boucle simple parcourant les 5 derniers éléments
; le premier est utilisé comme valeur maximale initiale.
; La différence avec la version 2 est qu'on initialise le compteur
; à 0 (au lieu de 1) mais on fait l'opération d'incrémentation au 
; début de boucle et non à la fin

; RO = pointeur du tableau
LDR R0, =data
; on charge la première valeur dans le registre R3 qui stocke le max.
; et on decale R0 pour aller sur la valeur suivante car ce n'est plus
; nécessaire de traiter la première valeur
LDR R3, [R0], #0x04
; on initialise le compteur à 0 et on incrémente jusqu'à 6
MOV R1, #0x00
boucle
; On fait l'incrémentation du compteur en début de boucle 
; pour ne pas retraiter la première valeur du tableau
ADD R1, R1, #1
; le reste est identique aux versions 1 et 2
CMP R1, #6
BEQ fin
LDR R2, [R0], #0x04
CMP R2, R3
MOVGT R3, R2

B boucle

; -------------------------
; Version 4 utilisant SUBS a la place de CMP et ADD
; Pour cela, on utilise un compteur qui décrémente de 6 à 0.

LDR R0, =data
; on charge la première valeur et on décale l'adresse sur la valeur suivante
LDR R3, [R0], #0x04
; le cpt commence à 6 et décrémente jusqu'à zero 
MOV R1, #0x06
boucle
; on utilise une decrementation car SUBS modifie les flags en passant à zero
; La décrémentation se fait en début de boucle comme la version 3 car
; la première valeur a déja été traitée.
SUBS R1, R1, #0x01
; le reste est identique aux précédentes versions.
BEQ fin
LDR R2, [R0], #0x04
CMP R2, R3
MOVGT R3, R2
B boucle


fin
B fin

SECTION DATA

data ASSIGN32 0xCAA330B0, 0xE7FA1998, 0x93C2C5DE, 0x9DC73798, 0xEFEF420A, 0x65ACDE56

