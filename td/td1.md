# TD 1 : Manipulation de données et calculs arithmétiques

## Instructions ARM supportées

Le simulateur supporte toutes les instructions ARMv4 à l'exception des instructions du co-processeur.
La syntaxe à utiliser est celle présentée dans les
[spécifications et documentations techniques](https://ginhac.com/teaching/archi/armv4-architecture-reference-manuel.pdf) d’ARM.

Une [fiche condensée](https://ginhac.com/teaching/archi/armv4-sheet.pdf) des instructions est également disponible.

Cependant, pour assurer une compatibilité maximale, il est toujours préférable de se reporter à la [documentation du simulateur](https://ginhac.com/teaching/archi/manuel-simulateurARM.pdf) qui décrit la liste exhaustive des instructions utilisables ainsi que leur syntaxe.

> Attention, le simulateur impose :
> * Toutes les mnémoniques (MOV, LDR, BL, etc.) doivent être écrites en **majuscules**
> * Tous les noms de registres (R0, R1, ..., R15) doivent être écrits en **majuscules**
> * Les étiquettes (main, fin) peuvent contenir, majuscules, minuscules et chiffres, mais pas commencer par un chiffre.


## Exercice 1 : Addition de nombres stockés dans des registres

Cet exercice utilise les instructions ```MOV``` et ```ADD```.
Pour plus d'information sur la syntaxe, voir la page 19 de la [documentation du simulateur](https://ginhac.com/teaching/archi/manuel-simulateurARM.pdf) pour les deux instructions.

Après avoir analysé la syntaxe de ```MOV``` et ```ADD```, écrivez un programme qui additionne deux valeurs stockées dans des registres :
* La première valeur 0xF7 est stockée dans le registre R0
* La deuxième valeur 0xDE est stockée dans le registre R1
* Le résultat de l'addition est stocké dans le registre R5

Quelle est la valeur de R5 ?

Modifiez le programme en utilisant les valeurs 0x7FFFFFF0 et 0x10.

Quelle est la valeur du résultat de l'addition en hexadécimal et en décimal signé ?

### 1. Corrigé Ex. 1

Voir le [corrigé](solutions/td1-ex1.asm).

## Exercice 2 : Déclaration de variables

La mémoire de l'ARM est divisée en plusieurs zones :
* La section CODE qui commence à l'adresse 0x80 contient la liste des instructions des programmes à exécuter.
* La section DATA qui commence à l'adresse 0x1000 contient les données des programmes à exécuter.

Pour déclarer une variable dans la section DATA, vous disposez de l'instruction
```ASSIGNxx``` avec xx qui désigne la taille en bits (8, 16, 32).
Par exemple ```maVariable ASSIGN32 0x1234``` crée une variable 32 bits nommée ```maVariable```
possédant comme valeur initiale ```0x1234```.

Pour allouer de l'espace sans initialiser la donnée, vous disposez de l'instruction
```ALLOCxx``` avec xx qui désigne la taille en bits (8, 16, 32).
Par exemple ```monEspace ALLOC32 10``` crée un espace contigu de 10 cases mémoire de 32 bits, soit 40 octets.


Ecrivez un programme qui déclare un espace ```resultat1``` de 2 mots de 32 bits, puis une variable 8 bits ```v1``` de valeur 0x42, puis un espace de 16 bits nommé ```resultat2```, puis une variable 16 bits ```v2``` initialisée à 0x1337, puis un espace de 8 bits nommé ```resultat3``` et une variable de 32 bits ```v3``` initialisée à 0x12345678.;

Lancez la simulation et visualisez la mémoire de la section DATA.
Repérez notamment les adresses des différentes variables et espaces alloués.
Comment sont organisées les données de v1, v2 et v3 ?

### Corrigé Ex. 2

Voir le [corrigé](solutions/td1-ex2.asm).

## Exercice 3 : Addition/soustraction de variables

Cet exercice utilise l'instruction ```LDR``` (voir pages 23 et 24) pour lire et stocker le contenu de la mémoire dans un registre.
Les opérations arithmétiques ``ADD``` (addition) et ```SUB```(soustraction) sont décrites page 19.

En utilisant les variables ```v1``` et ```v2``` définies à l'exercice 2, écrivez un programme qui réalise l'addition de ```v1``` et ```v2``` et stockez le résultat dans le registre R5.

Ajoutez la soustraction ```v1 - v2``` et stockez le résultat dans le registre R6.

Ajoutez la soustraction ```v2 - v1``` et stockez le résultat dans le registre R7.

Observez le codage en mémoire de R6 et R7. Comment peut-on passer de R6 à R7 (ou inversement) ?

### Corrigé Ex. 3

Voir le [corrigé](solutions/td1-ex3.asm).

## Exercice 4 : Addition/soustraction de variables - La suite

Cet exercice utilise l'instruction ```STR``` (pages 23 à 25).

Modifiez l'exercice 3 pour stocker le résultat de l'addition et de la soustraction dans l'espace ```resultats``` alloué en mémoire. Le résultat de l'addition sera placé dans la première case et le résultat de la soustraction sera placé dans la deuxième case.

Pour cela, utilisez l'instruction ```LDR``` pour charger l'adresse de ```resultats``` dans un registre ```Rx```.
Ensuite il suffira d'incrémenter la valeur du registre ```Rx``` de 4 octets pour accèder à la deuxième adresse ou devra être stocké le résultat de la soustraction. L'incrémentation de 4 octets peut se faire soit en utilisant l'instruction ```ADD``` sur le registre ```Rx```, soit en utilisant un des modes spécifiques d'adressage qui permet de faire directement l'incrémentation dans l'instruction ```LDR``` (voir page 24).

Ecrivez les 2 méthodes.

### Corrigé Ex. 4

Voir le [corrigé](solutions/td1-ex4.asm).

## Exercice 5 : Addressage mémoire

Recopiez le code suivant :

```asm

	SECTION INTVEC

B main


SECTION CODE

main

MOV R0, #0x1000

LDR R1, [R0]
LDR R2, [R0, #4]
LDR R3, [R0], #4
LDR R4, [R0, R2]
LDR R5, [R0, R2, LSL #3]
LDR R6, [R0, #2]
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
```

Exécutez ce code et observez / comprenez ce que fait chaque instruction.

### Corrigé Ex. 5

Voir le [corrigé](solutions/td1-ex5.asm).


## Exercice 6 : Décalage mémoire

En utilisant les instructions ```LSR``` qui réalise un décalage vers la droite et ```LSL``` qui réalise un décalage
vers la gauche (voir page 18), écrivez un programme qui modifie la valeur d'une variable ```valeur```initialisée à
```0x00008000``` et permet d'obtenir les valeurs suivantes :

* ```0x00004000``` dans R1;
* ```0x00000800``` dans R2;
* ```0x00000100``` dans R3;
* ```0x00000040``` dans R4;
* ```0x00010000``` dans R5;
* ```0x00400000``` dans R6;
* ```0x00080000``` dans R7;
* ```0x01000000``` dans R8;

### Corrigé Ex. 6

Voir le [corrigé](solutions/td1-ex6.asm).

## Exercice 7 : Tableau

Ecrivez un programme qui copie le contenu d'un tableau ```source``` de 4 éléments vers un tableau ```dest```.
Le tableau ```source```doit être initialisé avec l'instruction ```ASSIGN32``` et le tableau ```dest``` doit seulement être alloué en mémoire avec ```ALLOC32```.

Dans un premier temps, en l'absence de connaissance sur la manière de créer une boucle en assembleur ARM, vous ferez les 4 copies successives des données de ```source``` vers ```dest``` en utilisant correctement un des modes d'adressage de ```LDR``` et ```STR``` qui permet d'incrémenter les adresses après lecture ou écriture (voir exercice 4).

Dans un deuxième temps, analyser le fonctionnement d'une boucle sur n itérations (typiquement une boucle for en C) et proposez un code assembleur qui évite de faire les copies successives.

### Corrigé Ex. 7

Voir le [corrigé](solutions/td1-ex7.asm).

## Exercice 8 : Tableau

Modifiez le code de l'exercice 7 pour copier à l'envers les données de ```source``` vers ```destination```, c'est à dire que
la première donnée de ```source``` se retrouvera en dernière position de ```dest```, etc.

### Corrigé Ex. 8

Voir le [corrigé](solutions/td1-ex8.asm).

## Exercice 9 : Analyse de l'instruction ADD

Recopiez le code suivant :

```asm

	SECTION INTVEC

B main


SECTION CODE

main

LDR R0, =val1
LDR R1, [R0], #4
LDR R2, [R0], #4
LDR R3, [R0], #4
LDR R4, [R0], #4

ADD R6, R2, R1
ADD R7, R4, R3

fin
B fin

SECTION DATA

val1 ASSIGN32 0x10
val2 ASSIGN32 0x20
val3 ASSIGN32 0x30
val4 ASSIGN32 0x40
```

Exécutez ce code et trouvez dans la mémoire programme les valeurs sur 4 octets des instructions ```ADD R6, R2, R1``` et ```ADD R7, R4, R5```.
En vous aidant de la documentation [ARM](https://ginhac.com/teaching/archi/armv4-architecture-reference-manuel.pdf) (voir section A3.4), comprenez comment les numéros des registres sont encodés dans l'instruction ```ADD```.

## Exercice 10 : Modification de code

En reprenant le code de l'exercice 9, ajouter des instructions entre la dernière instruction ```LDR``` et la première ```ADD``` qui vont modifier le code des deux instructions ```ADD```. Par exemple, écrivez le code permettant de transformer l'instruction ```ADD R6, R2, R1``` en ```ADD R8, R2, R1``` et l'instruction ```ADD R7, R4, R3``` en ```ADD R7, R1, R2```.

Pour cela, vous devez déterminer le code sur 4 octets des nouvelles instructions et remplacer le code des instructions originales par le code modifié aux adresses mémoire ou sont stockées les instructions originales.

### Corrigé Ex. 10


Voir le [corrigé](solutions/td1-ex10.asm).
