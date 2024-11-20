SECTION INTVEC

B main

SECTION CODE

main

; ----------------------------------
; Plaçons des valeurs dans R1 et R2 
; CAS 1 : R1 > R2

MOV R1, #0x42
MOV R2, #0x15

; Comparons R0 et R1
; A chaque nouvelle comparaison, tous les flags sont reset à false
; Ici R1 > R2 donc flag N = false
CMP R1, R2
; exécuté  : R0 <- R1 car N = false
MOVGT R0, R1
; pas exécuté
MOVLT R0, R2
; pas exécuté
ADDEQ R0, R1, R2

; ----------------------------------
; Inversion des valeurs 
; CAS 2 : R1 < R2

MOV R1, #0x15
MOV R2, #0x42

; reset de R0
MOV R0, #0x0

; Comparons R0 et R1
; Ici R1 < R2 donc flag N = true
CMP R1, R2
; pas exécuté 
MOVGT R0, R1
; exécuté  : R0 <- R2 car flag N = true
MOVLT R0, R2
; pas exécuté
ADDEQ R0, R1, R2

; ----------------------------------
; Egalité des valeurs
; CAS 3 : R1 = R2

MOV R1, #0x42
MOV R2, #0x42

; reset de R0
MOV R0, #0x0

; Comparons R0 et R1
; Ici R1 = R2 donc flag N = false
CMP R1, R2
; pas exécuté car flag N = false
MOVGT R0, R1
; pas exécuté  car flag N = false
MOVLT R0, R2
;ezxécuté  : R0 <- R1+R2 car flag Z = true
ADDEQ R0, R1, R2


B main

SECTION DATA



