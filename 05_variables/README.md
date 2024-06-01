# Les variables

Un des outils les plus importants qu'offrent les langages de
programmation pour organiser nos idées est l'*abstraction*. Abstraire
une valeur désigne l'acte de lui donner un nom, et ainsi, une
signification. Le nombre `18`, par exemple, peut représenter plusieurs
informations différentes : une date, une quantité, une heure, l'âge de
la majorité dans certains pays, etc. La seule façon d'indiquer à quoi
cette valeur correspond dans notre programme est de la nommer.

## L'opérateur `define`

En programmation, cette association entre un nom et une valeur se nomme
*variable*. Pour définir une variable dans notre langage
d'apprentissage, on utilise l'opérateur `define`, suivi du nom et de la
valeur qu'on désire associés.

```
(define birthday 27)
        |        |
        nom      valeur
```

Une fois définie, une variable peut être utilisée comme n'importe quelle
autre expression. Au moment d'exécuter un programme, Racket remplacera
la variable par sa valeur. Vous pouvez utiliser le débogueur de DrRacket
pour observer cette substitution étape par étape.

```
(define funds 1000)
(define pay 500)

(+ funds pay)
   |     |
(+ 1000  500)
 |
 1500
```

Bien sûr, la valeur d'une variable peut être une sous-expression, auquel
cas la valeur de la variable sera la valeur de ladite sous-expression.

```racket
(define width 100)
(define height 50)
(define area (* width height))

(string-append "L'aire du rectangle est " 
               (number->string area))
```

## Les constantes

On se rappellera que les valeurs de notre programme sont *immuables* ;
c'est-à-dire qu'il est impossible de les modifier. L'expression `(+ 1
2)`, dont la valeur est `3`, ne change ni la valeur de `1`, ni la valeur
de `2`. Le nombre `3` est simplement une troisième valeur.

Il en va de même pour les variables de notre langage d'apprentissage. Il
est impossible de les modifier ou de les redéfinir. En programmation, on
se réfère souvent à ce genre de variables immuables comme étant des
*constantes*.

## Quand définir une variable

Au minimum, chacune des informations d'un problème devrait correspondre
à une variable de votre programme. On utilisera aussi les variables pour
simplifier des expressions complexes.

## Les conventions de nommage

Le nom d'une variable devrait indiquer ce que sa valeur représente. On
s'abstiendra donc de nommer une valeur `n` ou `x` puisque ces lettres
n'ont aucune signification. Pareillement, on fera attention aux
abréviations, qui peuvent porter à confusion. Enfin, si plusieurs mots
sont nécessaires, ont séparera ceux-ci par un trait d'union :
`book-title`, et non `bookTitle` ou `book_title`.

N'hésitez pas renommer vos variables lorsque vous trouvez un meilleur
nom pour celles-ci. Après avoir cliquez sur le bouton *CHECK SYNTAX*,
vous pouvez cliquer droit sur une variable, puis sélectionner *Rename
\<variable\>* pour renommer toutes les instances de ladite variable d'un
seul coup.

## Les formes spéciales

Bien qu'une expression dont l'opérateur est `define` ressemble à
n'importe quelle autre expression, elle diffère sur deux points.

Premièrement, à la différence des autres expressions vues jusqu'à
présent, les opérandes qui suivent l'opérateur `define` ne sont pas tous
évalués. Le premier opérande, qui correspond au nom de la variable, ne
peut donc pas être une sous-expression. 

```racket
> (define (string-append "impos" "sible") 5)
define: expected a variable, but found a string
```

Deuxièmement, vous remarquerez que les expressions qui définissent des
variables ne produisent pas de valeur. Rien n'apparait dans l'aire
d'interprétation lorsque vous les évaluez. 

En fait, `define` est ce qu'on appelle une *forme spéciale*. Comme leur
nom l'indique, les formes spéciales sont spéciales en ce qu'elles ont
leurs propres règles d'évaluation. Nous verrons d'autres formes
spéciales dans les séances à venir.

## Déboguer les variables

Après avoir évalué votre code en cliquant le sur bouton *RUN*, vous
pouvez demandez à DrRacket la valeur de n'importe quelle variable en
écrivant son nom dans l'aire d'interaction.
