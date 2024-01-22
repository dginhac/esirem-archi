# TD 2 : Conditions, branchements, fonctions, pile



## Exercice 1 : Comparaison de 2 nombres

Cet exercice utilise l'instruction ```CMP``` qui va mettre à jour les drapeaux 
dans le registre CPSR. Pour plus de détail sur les valeurs des différents drapeaux, se référer à [https://www.dmulholl.com/notes/arm-condition-flags.html](https://www.dmulholl.com/notes/arm-condition-flags.html).

Comparez deux nombres placés dans R1 et R2 et :  

* Si R1 > R2, mettre R1 dans R0. 
* Si R1 < R2, mettre R2 dans R0
* Si R1 = R2, mettre R1+R2 dans R0

Pour cela, vous utiliserez les instructions MOV ou ADD suivies d'un code à 2 lettres indiquant la condition. En effet, toutes les instructions peuvent être exécutées conditionnellement, en ajoutant un des codes à 2 lettres suivants à la fin de la mnémonique (voir page 16 du manuel).

Pour tester tous les cas possibles, commencez par ```R1<-#0x42``` 
et ```R2<-#0x15```par exemple, puis inversez les valeurs et enfin prenez 2 valeurs égales pour R1 et R2.

## Exercice 2 : Soustraction modifiée

En utilisant CMP, ADD, SUB, MOV et les conditions adéquates, écrivez le programme réalisant les fonctionnalités suivantes :

* si R1 est négatif, placez le résultat de R0 + R1 dans R2;
* si R1 est positif, placez le résultat de R0 - R1 dans R2;
* si R1 est égal à 0, place R0 dans R2.

## Exercice 3 : 

Refaites la même chose que pour l'exercice précédent, mais cette fois-ci en utilisant des branchements avec conditions. Notez comment le code est beaucoup moins concis et plus difficile à lire que le code de l'exercice 2.

## Exercice 4 :

Écrivez le programme qui calcule R0 = abs(R1 - R2), soit la valeur absolue de la différence entre deux registres.

## Exercice 5 :

Trouvez la valeur maximum dans un tableau en utilisant une boucle. La valeur maximale doit être stockée dans un registre à la fin du programme.

Le tableau contiendra les 6 valeurs suivantes :
```data ASSIGN32 0xCAA330B0, 0xE7FA1998, 0x93C2C5DE, 0x9DC73798, 0xEFEF420A, 0x65ACDE56```

## Exercice 6 :

Soit la fonction addition qui effectue une addition entre 3 registres R0, R1, R2 et qui stocke le résultat dans R0. 

Ecrivez le code de cette fonction pour calculer la somme de 0xEE, 0x02, 0x0F puis après retour dans le programme principal, stockez le résultat dans R3.

Voir les instructions BL pour appeler une fonction et BX pour sortir de la fonction.

## Exercice 7 :

Reprenez le code de l'exercice 4 et écrivez une fonction qui calcule la valeur absolue.

## Exercice 8 :

Ecrivez le code de la fonction mult qui effectue une multiplication entre R0 et R1 et qui stocke le résultat dans R2. 

Pour cette fonction, vous devez respecter les contraintes suivantes :
* Vous ne pouvez pas utiliser l'instruction MUL. 
* Vous ne pouvez utiliser que les 3 registres R0, R1 et R2

Quelles sont les valeurs comprises dans R0, R1 et R2 ?
Est-ce que les registres R0 et R1 ont été modifiés à l'intérieur de la fonction ? 

## Exercice 9 :

Etudiez le code suivant, testez le et mettez en évidence le problème généré par les calculs réalisés dans la fonction appelée.

```asm
SECTION INTVEC

B main

SECTION CODE

main
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
; R1 <- R0 + R0 
ADD R1, R0, R0
; R1 <- R0 + R1 = R0 + R0 + R0 = 3*R0
ADD R1, R1, R0
; R0 <- 3xR0
MOV R0, R1
BX LR
  
fin
B fin

SECTION DATA

```

Pour éviter de modifier les valeurs des registres lors de l'appel des fonctions, on peut utiliser une pile dans laquelle on va stocker temporairement (PUSH) les registres qui seront modifiés dans la fonction et ensuite restaurer ces valeurs initiales (POP) avant de quitter la fonction.

Modifiez le code de la fonction. 

# Exercice 10 :
Ecrivez la fonction Puissance qui calcule R0 à la puissance R1 et qui stocke le résultat dans R0. 
L'utilisation de l'instruction MUL est autorisée

Testez votre programme avec des valeurs différentes. 

# Exercice 11

```asm
SECTION INTVEC

B main

SECTION CODE

main
LDR SP, =maPile
ADD SP, SP, #40

; valeurs de test:
MOV R0, #4
MOV R1, #5

BL addsous

MOV R2, RO

B fin

; fonction addition R0 <- R0 + R1
addition
ADD R0, R0, R1
BX LR

; fonction soustraction R0 <- R0 - R1
soustraction
SUB R0, R0, R1
BX LR

; function test qui fait appel à addition et à soustraction
; 
addsous
; R0 <- R0 + R1
BL addition
; R0 <- R0 - R1 = R0 + R1 - R1 = R0
BL soustraction
BX LR

fin
B fin

SECTION DATA
maPile ALLOC32 10
```
Exécutez ce code. Est-ce que l'instruction ```MOV R2, RO```  située après l'appel de la fonction ```BL addsous``` s'exécute ?
Pourquoi ?
Que faut il ajouter pour que cela fonctionne ?


# Exercice 12

Ecrivez la fonction Factorielle qui calcule la factorielle d'un nombre placé dans R0 et qui retourne le résultat dans R1.

