![bucket brigade](https://people.eecs.berkeley.edu/~bh/ss-pics/bucket.jpg)

# Expressions

Nous avons mentionné précédemment (voir le chapitre sur les éléments 
de la programmation) qu'un langage de programmation est formé
d'*expressions*. Une expression représente une question posée à
l'ordinateur. L'ordinateur répondra toujours une *valeur*. 

Par exemple, on peut demander à l'évaluateur Racket quelle est valeur du
nombre 20 :

```scheme
> 20
```

Pour être plus précis, notre question est « quelle est la valeur des
deux chiffres arabes utilisés pour représenter vingt dans le système
décimal ? » Question à laquelle l'évaluateur répondra en affichant la
réponse :

```racket
> 20
20
```

**Note** : Dans les examples ci-haut, le caractère `>` indique
l'expression que nous entrons dans l'aire d'intéraction de DrRacket. La
ligne suivante est la valeur de l'expression telle que produite par
l'évaluateur Racket. La même expression (sans le caractère `>`) peut
être entrée dans l'aire de définition de DrRacket. Il suffira alors de
cliquer sur le bouton *RUN* pour que le résultat s'affiche dans l'aide
d'intéraction.

## Expressions composées

Une expression peut être *atomique*, comme `20`, ou *composée*. 
Comme son nom l'indique, une expression composée est faite de 
plusieurs expressions atomiques (aussi appelées dans ce contexte 
« sous-expressions »). Voici un example d'expression composée :

```racket
> (+ 14 7)
21
```

L'expression composée ci-haut est faite des trois expressions `+`, 
`14` et `7`, lesquelles sont entourées de parenthèses. La première
sous-expression d'une expression composée se nomme *opérateur*. 
Les sous-expressions suivantes sont des *opérandes*.

```
(+         14 7)
 |         |  |
opérateur opérandes
```

L'opérateur indique le nom de la *procédure* à appliquer aux
opérandes. Une procédure est une série d'instructions à exécuter lorsque
ladite procédure sera *appelée* ou *invoquée* par son nom. Ici, la
procédure à exécuter est celle de l'addition, dont le nom en Racket est
`+`. La valeur d'une expression composée est le résultat de la
procédure. La valeur de l'expression `(+ 14 7)` est donc `21`.

## Notation préfixée

Vous aurez remarqué que l'ordre de l'opérateur et des opérandes n'est
pas celui auquel vous êtes habitué·es. En mathématique, la même
opération s'écrit avec l'opérateur *entre* les opérandes, selon la
notation dite *infixée* : 14 + 7. Racket utilise plutôt la notation
dite *préfixée* ; l'opérateur est toujours *devant* les opérandes. 

Quoique, d'emblée, la notation préfixée peut porter à confusion, elle a
plusieurs avantages. Notamment, elle permet de définir facilement des
procédures qui peuvent s'*appliquer* sur un nombre arbitraire
d'opérandes :

```racket
> (+ 10 5 100)
115
```

## Expressions imbriquées

La notation préfixée permet également d'imbriquer facilement plusieurs
expressions :

```racket
> (+ (* 3 5) (- 10 6))
19
```

Comment comprendre cette expression composée ? Le truc est d'évaluer
chaque sous-expression indépendamment :

```
(+ (* 3 5) (- 10 6))
    |       |
(+  15      4)
 |
 19
```

Quoiqu'il n'y a pas de limite quant au nombre d'expressions qui peuvent
être imbriquées les unes dans les autres, il devient rapidement
difficile pour nous de comprendre des expressions avec plusieurs niveaux
d'imbrication. Pour aider la lecture, il est recommandé de formatter les
sous-expressions de sorte à ce que les opérandes soient alignées
verticalement. DrRacket offre la commande `Racket > Reindent All` qui
reformate le code correctement.

```racket
> (+ (* 3
        (+ (* 2 4)
           (+ 3 5)))
     (+ (- 10 7)
        6))
```

Êtes-vous capable d'évaluer le résultat de l'expression ci-haut ?
Rappelez-vous, le truc est de commencer par évaluer les sous-expressions
en commençant par celles qui sont plus « profondes ». Ne faites pas
l'erreur de lire Racket de gauche à droite ; lisez plutôt de l'intérieur
vers l'extérieur.

## Débogueur

Si vous avez de la difficulté à évaluer l'expression composée ci-haut,
ne vous en faites pas. DrRacket possède un outil nommé *algebraic
stepper* qui permet d'évaluer une expression étape par étape. Pour
l'utiliser, copiez l'expression dans l'aire de définition de DrRacket,
puis cliquez sur le bouton *Step*.

## C'est tout

Vous connaissez maintenant toute la syntaxe de Racket (et, par
extension, celle des autres dialectes Lisp). Le même principe —
appliquer une procédure à des opérandes — peut être utilisé pour
manipuler toutes sortes de données, pas seulement des nombres. Les
sections suivantes aborderont comment mettre en œuvre cette idée 
simple afin de créer des programmes plus complexes.
