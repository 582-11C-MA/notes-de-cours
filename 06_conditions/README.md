# Les expressions conditionnelles

En japonnais, comme dans plusieurs langues, la façon de saluer les gens
change selon la période de la journée. Si nous sommes le matin, on dit
おはよう (ohayō). Si nous sommes l'après-midi, on dit こんにちは
(konnichiwa). Si nous sommes le soir, on dit こんばんは (konbanwa).

Comment exprimer ces trois possibilités d'une façon que l'ordinateur
comprend ? Pour ce faire, il faudrait un moyen de définir des
*conditions* : 

-   *Si* l'heure est entre 0 et 12, *alors* la salutation appropriée
    est « ohayō ».
-   *Si* l'heure est entre 12 et 17, *alors* la salutation appropriée
    est « konnichiwa ».
-   *Si* l'heure est entre 17 et 24, *alors* la salutation appropriée
    est « konbanwa ».

Autrement dit, la valeur de `salutation` change selon la valeur de
`heure`.

Pour représenter ce genre de situation en Racket, on utilise l'opérateur
`cond` (pour condition). Une expression dont l'opérateur est `cond` est
une *forme spéciale* ; c'est à dire que sa valeur est évaluée
différemment des autres expressions normales. Voici à quoi ressemble
l'exemple ci-haut (quelque peu simplifié) traduit dans notre langage de
programmation :

```racket
(define current-time 10)

(cond ((< current-time 12) "ohayō")
      ((< current-time 17) "konnichiwa")
      ((< current-time 24) "konbanwa"))
```

`cond` n'utilise pas les parenthèses de la même façon que les autres
expressions. Certaines parenthèses à l'intérieur d'une expression `cond`
sont utilisées pour définir des *clauses*. L'exemple ci-haut contient
trois clauses : une pour chacun des cas possibles. La convention veut
que les clauses soient alignées verticalement afin de faciliter la
lecture.

```
(cond (test-1 résultat-1)
      (test-2 résultat-2)
      ...
      (test-n résultat-n))
```

Une clause contient une *expression de test*, puis une *expression de
résultat*. Les tests sont évaluées de haut en bas, en s'arrêtant au
premier qui évalue à `#true`. La valeur de l'expression de résultat
correspondante est alors évaluée, puis retournée comme valeur finale de
l'expression `cond`.

## `else`

Conventionnellement, on termine toujours une expression `cond` avec une
clause `else`. Cela assure que l'expression aura toujours une valeur,
même si aucun test évalue à `#true`. Autrement dit, on peut voir `else`
comme une expression qui évaluera toujours à `#true`.

```racket
(define current-time 10)

(cond ((< current-time 12) "ohayō")
      ((< current-time 17) "konnichiwa")
      ((< current-time 24) "konbanwa")
      (else "nani?!"))
```

## Nommer les tests

Une expression `cond` peut vite devenir difficile à lire si les
expressions de test et de résultat sont complexes. Pour cette raison,
lorsque possible, on abstraira ceux-ci à l'aide de variables (et,
éventuellement, de fonctions) auxiliaires.

Dans l'exemple précédent, que représente l'expression de test `(<
current-time 12)` ? Si l'heure est plus petite que 12, alors c'est
l'avant-midi ! On pourrait donc améliorer la lisibilité et la robustesse
de notre code en utilisant une variable.

```racket
(define current-time 10)

(define am? (and (>= current-time 0) (< current-time 12)))
(define pm? (and (>= current-time 12) (< current-time 17)))
(define evening? (and (>= current-time 17) (< current-time 24)))

(cond (am? "ohayō")
      (pm? "konnichiwa")
      (evening? "konbanwa")
      (else "nani?!"))
```

## Déboguer les conditions

N'hésitez pas à cliquer sur le bouton *STEP* pour lancer le débogueur,
et voir DrRacket évaluer vos expressions conditionnelles étape par
étape. Lorsque vous cliquez sur *RUN*, vous remarquerez aussi que DrRacket
colorie en rouge les clauses qui ne sont pas évaluées.
