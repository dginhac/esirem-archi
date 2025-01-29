# Calculatrice en Notation Polonaise Inverse pour ARM7TDMI**

## Introduction

L'objectif de ce TP est de développer une calculatrice fonctionnant en notation polonaise inverse (RPN) en utilisant l'assembleur de l'ARM7TDMI. Les expressions mathématiques à évaluer seront stockées dans la mémoire de l'ARM sous la forme d'un tableau de données ASCII codées sur 8 bits.

![Une Calculatrice RPN](../images/rpn_calculator.jpg "Une Calculatrice RPN").



### 1. Définition de la Notation Polonaise Inverse (NPI)

La Notation Polonaise Inverse (NPI) ou Reverse Polish Notation (RPN) en anglais, est également appelée notation post-fixe. Il s'agit d'une méthode de notation mathématique dans laquelle les opérateurs suivent leurs opérandes. En d'autres termes, au lieu d'écrire une expression avec l'opérateur entre les deux opérandes comme dans la notation habituelle (infixe), on place l'opérateur après les opérandes.

Par exemple, considérons l'expression infixée simple :

```3 * (10 + 5)```

En notation polonaise inverse, cela s'écrit :

```3 10 5 + *```

Pour évaluer une expression en notation polonaise inverse, on lit de gauche à droite et on effectue les opérations dès qu'on rencontre un opérateur. On prend les deux derniers nombres rencontrés comme opérandes pour l'opération.

Dans l'exemple ci-dessus, on additionne 10 et 5 pour obtenir 15, puis on multiplie le résultat par 3 pour obtenir 45

L'avantage de la notation polonaise inverse est qu'elle élimine la nécessité d'utiliser des parenthèses pour indiquer l'ordre des opérations, car l'ordre est déterminé par la séquence des opérateurs. Cela simplifie l'évaluation des expressions mathématiques. Les calculatrices à notation polonaise inverse utilisent ce concept, où l'utilisateur entre d'abord les opérandes, puis l'opérateur.


### 3. Principes de calcul des opérations NPI

Pour evaluer une opération RPN post-fixée, on utilise une pile (stack en anglais). Une pile est une structure de données de type LIFO (Last In, First Out), ce qui signifie que le dernier élément ajouté à la pile est le premier à être retiré.

Voici comment la pile est utilisée lors de l'évaluation d'une expression en NPI :

1. Parcours des symboles : Lorsque vous parcourez une expression en NPI de gauche à droite, vous rencontrez des opérandes (nombres) et des opérateurs.
2. Opérandes sur la pile : Les opérandes sont placés sur la pile. Chaque fois que vous rencontrez un nombre, vous l'ajoutez à la pile.
3. Opérateurs : Lorsque vous rencontrez un opérateur, vous retirez les deux derniers opérandes de la pile, vous effectuez l'opération et vous replacez le résultat sur la pile. Cela garantit que les opérations sont effectuées sur les bons opérandes.
4. Répétition : Vous continuez à parcourir l'expression, ajoutant des opérandes sur la pile et effectuant des opérations avec les opérateurs jusqu'à ce que vous ayez parcouru toute l'expression.
5. Résultat final : Une fois que vous avez parcouru toute l'expression, le résultat final se trouve au sommet de la pile.

Par exemple, considérons l'expression ```3 10 5 + *```, 
l'algorithme mis en oeuvre est (voir image ci-dessous) : 

* Ajout de 3 à la pile.
* Ajout de 10 à la pile.
* Ajout de 5 à la pile.
* Rencontre de l'opérateur ```+```, donc retrait de 5 et 10 de la pile, addition, et ajout de 15 à la pile.
* Rencontre de l'opérateur ```*```, donc retrait de 15 et 3 de la pile, multiplication, et ajout de 45 à la pile.

À la fin de ce processus, le résultat final (45) se trouve au sommet de la pile.

La pile est un mécanisme essentiel pour suivre l'ordre d'évaluation des opérations dans la notation polonaise inverse sans avoir besoin d'utiliser des parenthèses pour déterminer l'ordre des opérations.

![Exemple de calcul RPN](images/RPN-sample.png "Exemple de calcul RPN").

## Fonctionnalités principales à développer

### 1. Stockage des expressions à évaluer en ASCII

La première étape est de proposer un codage des opérations afin de pouvoir les écrire dans la mémoire du processeur ARM.

Le codage ASCII est un ensemble de codes sur 8 bits permettant de représenter les caractères textuels. Il attribue un nombre unique à chaque caractère, ce qui permet aux ordinateurs de stocker et de manipuler du texte de manière standardisée.

Pour les chiffres et les lettres, l'ASCII utilise des valeurs numériques spécifiques. Les chiffres de 0 à 9 sont codés de 0x30 à 0x39, l'espace est codé 0x20, les lettres majuscules de 0x41 à 0x5A et les minuscules de 0x61 à 0x7a. Les opérateurs mathématiques de base sont codés de la manière suivante : + (0x2B), - (0x2D), * (0x2A) et / (0x2F), ...

Vous retrouverez l'ensemble de la table ASCII sur la figure suivante :

![Table ASCII](images/ASCII-Table.png "Table ASCII").

En utilisant le code des chiffres et des opérations de base 
```(*, +, -, /)```, encodez plusieurs opérations de complexité croissante comme par exemple :
* 13 + 4 
* 328 + 42 - 2
* (3 + 4) * 2
* (3 + 4) * (5 + 6)
* 543 + (-412 +4)
* ...

Les exemples donnés ci-dessus sont écrits en notation classique infixe. Il est donc nécessaire tout d'abord de les transformer en notation NPI avant de les encoder en ASCII. N'oubliez pas d'utiliser un caractère spécifique marquant la fin de l'opération. 

Attention, un nombre comme 328 utilisera 3 octets consécutifs correspondant aux 3 valeurs ASCII des chiffres 3, 2 et 8. N'oubliez pas de rajouter un caractère permettant d'indiquer la fin du nombre et ainsi de le séparer du nombre ou de l'opérateur qui le suit.

### 2. Lecture de l'opération stockée en mémoire

L'opération à évaluer étant écrite dans une zone mémoire, il faut tout d'abord la lire. Pour cela, écrivez une fonction qui s'occupe de lire les octets successifs de l'expression et décode l'opération à effectuer.

### 3. Evaluation en NPI

Chaque octet doit être interprété en fonction de son contenu (opérande ou opérateur). Pour cela, écrire le code permettant de : 
* Stocker chaque nouvel opérande dans la pile 
* Dépiler les dernières valeurs de la pile pour exécuter l'opération lue.

On se contentera dans un premier temps des opérations élémentaires (addition, soustraction, multiplication) travaillant sur des entiers positifs ou négatifs. 
On ajoutera la division 
```x/y``` sous la forme d'une fonction calculant le quotient entier 
```q``` en utilisant l'algorithme suivant :
```
q = 0;
TantQue (x > y) Faire
        x := x - y;
        q := q + 1;
    FinTantQue
```

### 4. Extensions possibles.

* Gestion des opérations supplémentaires : Ajoutez la possibilité d'inclure des opérations mathématiques supplémentaires : modulo, puissance, valeur absolue, décalages, comparaison, logique, ...

* Gestion des codages des nombres : Ajoutez la possibilité d'utiliser des nombres décimaux ou hexadécimaux

* Gestion d'erreurs : Implémentez un mécanisme de gestion d'erreurs pour signaler à l'utilisateur des problèmes tels que la division par zéro ou une expression mal formée.


