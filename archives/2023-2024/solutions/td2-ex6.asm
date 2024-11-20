SECTION INTVEC

B main

SECTION CODE

main
; Initialisons les registres à utiliser par la fonction addition
MOV R0, #0xEE
MOV R1, #0x02
MOV R2, #0x0F

; Appelons notre fonction avec l'instruction BL (Branch and Link)
; L'appel de la fonction va modifier la valeur du registre LR
; qui va contenir l'adresse de la prochaine instruction a exécuter
; après la fin de la fonction, c'est à dire l'adresse de 
; l'instruction MOV R3, R0 (voir ci-dessous).
BL addition

; Plaçons le résultat de la fonction (dans R0) dans R3.
MOV R3, R0
; ne pas oublier de sauter à la fin du programme 
; car sinon, le code de la fonction sera à nouveau exécuté.
B fin

; Fonction qui additionne trois nombres placés dans R0, R1, et R2
; 3 parametres en entrée : R0, R1, R2
; 1 valeur de retour : R0

addition
ADD R0, R0, R1
ADD R0, R0, R2
; la sortie de la fonction se fait avec un 
; BX (Branch and Exchange ) vers LR

BX LR
  
fin
B fin

