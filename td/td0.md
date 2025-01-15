# TD 0 : Installation du simulateur

L'étape d'installation est requise avant de pouvoir travailler sur les différents exercices des TD et TP.
Elle ne doit être réalisée qu'une seule fois sur chaque PC. Votre enseignant vous donnera les consignes en fonction de la salle informatique dans laquelle vous ferez les TD/TP.

Si vous utilisez votre propre PC, vous devez effectuer cette installation.

## Avant l'installation

Une installation de Python (Version >= 3.4 et Version <= 3.11) et de pip est nécessaire.
Si vous n'avez aucune installation de Python, veuillez vous référer à la [documentation](https://www.python.org/downloads/) spécifique à votre système d'exploitation.

Idéalement, une installation de Python sous la forme d'un environnement virtuel est recommandée.
Voir la [documentation](https://docs.python.org/fr/3/tutorial/venv.html) pour plus d'informations.

## Installation du simulateur

Le [simulateur ARM](http://gif1001-sim.gel.ulaval.ca/?page=accueil) a été développé originalement par l'Université de Laval pour son module intitulé [GIF-1001 Ordinateurs: Structure et Applications](https://www.ulaval.ca/les-etudes/cours/repertoire/detailsCours/gif-1001-ordinateurs-structure-et-applications.html).
Son code source est disponible sut [GitHub](https://github.com/mgard/epater) sous license GPL V3.0.

Pour les besoins de ces TD/TP, un [fork](https://github.com/dginhac/arm-simulateur) a été réalisé et vous pouvez donc cloner le dépôt Github de ce [fork](https://github.com/dginhac/arm-simulateur) sur votre PC.

## Installation des packages nécessaires

Copier le dossier arm-simulateur dans votre environnement virtuel python ou dans un dossier de votre choix (si vous n'utilisez pas d'environnement virtuel).

Le simulateur nécessite l'installation de certains packages Python :
* websockets (version 12.0)
* gevent (version 24.2.1)
* bottle (version 0.12.25)
* bs4 (version 0.0.2)
* ply (version 3.11)
* polib (version 1.2.0)
* beautifulsoup4 (version 4.12.3)

Vous pouvez installer ces packages en utilisant la commande ```pip install -r requirements.txt```, le fichier requirements.txt étant fourni avec les versions des packages nécessaires pour une version 3.11 de Python.

Une fois copié, dans le dossier du arm-simulateur, il faut exécuter ```pip install -r requirements.txt``` pour installer les packages nécessaires.

## Initialisation du simulateur

Exécuter (une seule fois) la commande ```python utils/po2mo.py``` pour créer l'ensemble des fichiers de traduction.

## Lancement du simulateur

Ensuite, vous pouvez lancer le simulateur

```python mainweb.py DEBUG```

puis ouvrir une fenêtre de navigateur à l'adresse [http://127.0.0.1:8000/](http://127.0.0.1:8000/).
Vous devriez voir apparaître une vue ressemblant à l'image ci-dessous.

> Attention, si vous êtes dans une salle machine de l'école et que vous êtes connectés en remote sur un serveur linux, vous devez au préalable modifier les ports utilisés par le simulateur. Si vous ne le faites pas, seul le premier utilisateur pourra exécuter le simulateur, les autres auront un message d'erreur.
>
> Pour cela, éditez le fichier mainweb.py avec un éditeur de texte puis modifiez les 2 lignes suivantes :
> * Ligne 775 : Remplacer la valeur ```8000``` dans l'expression ```port=8000``` par une autre valeur (8001, 8002, ...)
> * Ligne 807 : Remplacer la valeur ```31415``` dans l'expression ```websockets.serve(handler, '0.0.0.0', 31415)``` par une autre valeur (31416, 31417, ...)


![Vue du simulateur](https://github.com/dginhac/arm-simulateur/blob/master/doc/sample_screenshot3.png)

L'installation est maintenant terminée.
Vous pouvez maintenant consulter la [documentation](https://ginhac.com/teaching/archi/manuel-simulateurARM.pdf) du simulateur et commencer à lire le [td1](td1.md).
