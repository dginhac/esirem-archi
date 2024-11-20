SECTION INTVEC

B main

SECTION CODE

main

; Plaçons des valeurs dans R1 et R2
MOV R1, #1
MOV R2, #10

; ---------------------------
; Solution 1 à 3 instructions
CMP R1, R2        ; calcule R1 - R2, change les drapeaux
SUBGT R0, R1, R2   ; si R1 > R2, R0 = R1 - R2
SUBLE R0, R2, R1   ; si R1 <= R2, R0 = R2 - R1

; ---------------------------
; Solution 2 à 2 instructions
SUBS  R0, R1, R2   ; calcule R1 - R2, change les drapeaux
RSBLE R0, R0, #0   ; si R1 <= R2, R0 = -R0 (donc R0 = R2 - R1)

B main

SECTION DATA

