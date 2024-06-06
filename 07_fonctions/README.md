# Les fonctions

Abstraire quelque chose, c'est lui donner un nom. Jusqu'à présent, nous
avons nommé des valeurs. Par exemple, on peut associer le nombre `5` au
nom `garden-width` et le nombre `10` au nom `garden-length` afin de
signifier les dimensions d'un jardin. Si on désire ensuite calculer son
aire, il suffira de multiplier `garden-width` et `garden-length`, puis
d'assigner un autre nom au résultat de cette opération. 

```racket
(define garden-width 5)
(define garden-length 10)

(define garden-area (* garden-width 
                       garden-length)) 

garden-area ; => 50
```

Nous avons également distingué le rôle que jouent ces variables dans un
programme. Ci-haut, `garden-width` et `garden-length` sont des
*variables d'entrée*, alors que `garden-area` est une *variable de
sortie*. Autrement dit, `5` et `10` sont les valeurs que notre programme
reçoit, alors que `50` est la valeur que notre programme retourne.

Le problème avec le code ci-haut est qu'il permet de calculer l'aire
d'un seul jardin. Certes, on peut changer manuellement la valeur des
variables d'entrée, mais si le programme doit calculer à la fois l'aire
de mon jardin ainsi que celui de ma voisine, il faudra dédoubler le
nombre de variable à définir.

```racket
(define my-garden-width 5)
(define my-garden-length 10)

(define my-garden-area (* my-garden-width 
                          my-garden-length)) 

(define neighbour-garden-width 5)
(define neighbour-garden-length 10)

(define neighbour-garden-area (* neighbour-garden-width 
                                 neighbour-garden-length)) 
```

Or, vous remarquerez que la *procédure* (c'est-à-dire, la liste des
étapes) pour calculer l'aire de mon jardin est exactement la même que la
procédure pour calculer l'aire du jardin de ma voisine. Dans les deux
cas, on multiplie la longueur du jardin par sa largeur. L'opération est
identique ; seules les valeurs changent. 

Notre code serait plus succinct et flexible si nous pouvions donner un
nom à la procédure par laquelle on calcule l'aire, et ainsi appliquer
cette même procédure à différents jardins, de la même façon qu'on
utilise l'opérateur `+` pour additionner n'importe quel nombre, ou
l'opérateur `string-append` pour concaténer n'importe quelle chaîne.

Voilà à quoi servent les *fonctions*. Tout comme une variable désigne
une association entre un nom et une valeur, une fonction désigne une
association entre un nom et une procédure.

## Les paramètres

Définir une fonction nécessite de décrire les opérations qui seront
effectuées sur des variables, sans savoir d'avance la valeur de ces
variables. Pour reprendre l'exemple précédent, le but est de
*généraliser* l'opération qui produit l'aire d'un jardin, peu importe
la largeur et la longueur de celui-ci. 

Pour ce faire, il faut des variables qui feront office de *valeurs
provisoires* (*placeholders*, en anglais). Le terme technique qui
désigne ces valeurs provisoires est « paramètre formelle » (ou seulement
« paramètre »). Au moment de définir la fonction, un paramètre n'a pas
de valeur fixe. Il représente plutôt toutes les valeurs sur lesquelles
il est possible d'appliquer la procédure. Seul au moment d'*appeler* la
fonction est-ce que l'évaluateur Racket remplacera les paramètres par
leur valeur actuelle (`5` et `10`, par exemple, ou `7` et `12`).

Une fonction qui calcule l'aire d'un jardin aura donc deux paramètres :
un pour la longueur et un autre pour la largeur. (Vous remarquerez que
les paramètres correspondent ici aux valeurs d'entrée. Effectivement, on
pourrait dire que les paramètres sont les valeurs d'entrée de notre
fonction.) Dans notre langage d'apprentissage, une fonction a toujours
au moins un paramètre. Voici comment définir le nom de la fonction
`area` ainsi que ses paramètres :

```
(define (area width length) ...)
         |    |     | 
         nom  paramètres
```

On appellera cette partie l'*entête* de la fonction. Comme vous pouvez
voir, la syntaxe utilisée pour définir une fonction est similaire à
celle pour définir une variable. 

## Le corps

Maintenant que sont définis le nom et les paramètres de la fonction, on
peut définir son *corps*. Le corps d'une fonction est l'expression qui
sera évaluée lorsque la fonction sera appliquée sur des « vraies »
valeurs. Attention, le corps d'une fonction n'est *pas* évalué lorsqu'on
*définit* la fonction. Le corps est plutôt comme une recette : il
contient seulement les étapes à suivre quand la fonction sera appelée.

```
(define (area width length) (* width length))
        ------------------- ----------------
                  |                |
                entête           corps
```

On lira cette définition de la façon suivante : « Pour calculer l'aire
d'un jardin, étant donné sa largeur et sa longueur, multiplie sa
sa largeur et sa longueur. »

## Appliquer une fonction

Une fois la fonction définie, on peut utiliser son nom comme n'importe
quel autre opérateur.

```racket
(area 5 10) ; => 50
(area 20 2) ; => 40
```

Il existe plusieurs termes pour désigner l'utilisation d'une fonction :
on dit parfois « appeler une fonction », ou « appliquer une fonction sur
des arguments ». Le terme *argument* se réfère aux valeurs qui sont
données à la fonction pour chaque paramètre. Ci-haut, `5` et `10` sont
les arguments donnés pour les paramètres `width` et `length`. L'ordre
des arguments correspond ainsi à l'ordre des paramètres.

```
(define (nom paramètre-1 paramètre-2 paramètre-n) corps)
--------------------------------------------------------
                           |
                       définition


        (nom argument-1  argument-2  argument-n)
        ----------------------------------------
                           |
                      application
```

## La portée

Vous remarquerez que, dans l'exemple précédent, `width` et `length`
sont utilisés dans le corps de la fonction, et ce, même si notre code
ne contient pas d'expression `define` pour définir ces deux variables.
Lorsqu'on définit les paramètres d'une fonction, on peut ensuite
utiliser ceux-ci comme variables, mais seulement à l'*intérieur*
du corps de la fonction. Si notre code tente d'utiliser `width` à
l'*extérieur* du corps de la fonction, l'évaluateur Racket affichera 
une erreur.

L'environnement dans lequel une variable est accessible est appelé la
*portée* de cette variable. Jusqu'à présent, les variables que nous
avons définies avec l'opérateur `define` avaient toutes une portée
*globale*. Une variable dont la portée est globale peut être utilisée à
l'intérieur de n'importe quelle expression d'un programme, même si la
variable a été définie à l'extérieur de cette expression.

```racket
(define student "Nupur")
student ; => "Nupur"
```

Les paramètres d'une fonction sont des variables dont la portée est
*locale*. Une variable dont la portée est locale peut seulement être
utilisée à l'intérieur de l'expression où la variable a été définie.

```racket
(define (greet name) (string-append "Bonjour " name)) ; correct
name ; => name: this variable is not defined
```

Deux fonctions peuvent donc avoir des paramètres avec le même nom sans
que les paramètres de la première fonction entrent en conflit avec ceux
de la seconde.

```racket
(define (greet name) (string-append "Bonjour " name))
(define (leave name) (string-append "Au revoir " name))

(greet "Raphael") ; => "Bonjour Raphael"
(leave "Sarah")   ; => "Au revoir Sarah"
```

## Déboguer les fonctions

Au début, l'application d'une fonction sur des arguments peut porter à
confusion. On vous conseille d'utiliser le débogueur de DrRacket (le
bouton *STEP*) pour voir comment l'évaluateur substitue les paramètres
pour les valeurs avec lesquelles une fonction est appelée.

Si la notion de portée cause problème, n'oubliez pas que, après avoir
cliqué sur *CHECK SYNTAX*, vous pouvez placer votre curseur sur une
variable pour voir où celle-ci est définie.
