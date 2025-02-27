# Nommer les valeurs

Un des outils les plus importants qu'offrent les langages de
programmation pour organiser nos idées est l'_abstraction_. Abstraire
une valeur désigne l'acte de lui donner un nom, et ainsi, une
signification. Le nombre `18`, par exemple, peut représenter plusieurs
informations différentes : une date, une quantité, une dimension, l'âge
de la majorité dans certains pays, etc. La seule façon d'indiquer à quoi
cette valeur correspond dans notre programme est de la nommer.

En programmation, cette association entre un nom et une valeur s'appelle
une _affectation_. Dans notre environnement d'apprentissage, on affecte
un nom à une valeur avec l'opérateur `=`. Voici par exemple comment
donner le nom `radius` à la valeur `18` :

```pyret
radius = 18
```

À gauche du `=` se trouve le nom qui sera affecté à l'expression qui se
trouve à droite. Au moment d'exécuter le code, Pyret remplacera
automatiquement toutes les occurrences du nom par la _valeur_ de son
expression. Si vous exécutez le code suivant, par exemple, Pyret
affichera la valeur `9`, et non `4 + 5`.

```pyret
n = 4 + 5
n
```

On peut donner un nom à n'importe quelle expression ; même à celles qui
sont composées d'autres expressions. Le code ci-dessous affecte le nom
`red-circle` à l'expression qui permet de créer un cercle rouge.

```pyret
red-circle = circle(radius, "solid", "red")
```

Si vous demandez ensuite à Pyret d'évaluer l'expression `red-circle`,
vous remarquerez que sa valeur est une image d'un cercle rouge dont le
rayon est 18, la valeur de l'affectation `radius` définie précédemment.

> [!NOTE]\
> On utilise parfois la métaphore de la boîte pour expliquer
> l'affectation. Affecter une valeur à un nom serait comme mettre la
> valeur dans une boîte sur laquelle est écrit le nom en question. Cette
> image est toutefois trompeuse. Vous verrez éventuellement qu'une même
> valeur peut avoir plusieurs noms. Une meilleure métaphore est celle de
> l'étiquette : affecter un nom à une valeur est comme coller une
> étiquette sur celle-ci.

Que se passe-t-il si on tente de se référer à un nom qui n'a pas été
précédemment affecté à une valeur ? Exécutez par exemple le code suivant
dans l'environnement d'apprentissage :

```pyret
puppy
```

Pyret affichera un message d'erreur nous avertissant que le nom `puppy`
est _unbound_, c'est-à-dire non-affecté. À moins que vous utilisiez un
nom déjà connu de Pyret comme `num-min`, assurez-vous toujours de
définir l'affection _avant_ d'utiliser son nom dans votre programme.

## Noms versus chaînes

En programmation, on utilise les mots de deux façon :

1. dans des chaînes de caractères comme `"blue"` ou `"solid"`, et
2. comme des noms pour les affectations (`radius`, `red-circle`).

Ces deux façons d'utiliser les mots peuvent sembler similaires, mais
elles représentent deux choses complètement différentes. Voyons ce qu'on
entend par cela.

- Syntaxiquement (c'est-à-dire, du point de vue de leur écriture), on
  distingue les deux par la présence de guillemets anglais. Notez la
  différence entre `puppy` et `"puppy"`.

- Les chaînes peuvent contenir des espaces, tandis que les noms ne le
  peuvent pas. La valeur `"hot pink"` est une seule chaîne valide, alors
  que `hot pink` fait référence à deux affectations différentes. Si un
  nom contient plusieurs mots, ceux-ci doivent être collés ensemble.
  Pour ce faire, on utilise dans Pyret le trait d'union (`hot-pink`),
  mais cela dépend des langages de programmation.

- Sémantiquement (c'est-à-dire, du point de vue de leur signification),
  un nom et une chaîne représentent deux questions complètement
  différentes posées à l'ordinateur. Lorsqu'on demande la valeur de
  `puppy`, on demande à l'ordinateur quelle est la valeur qui a été
  précédemment affectée à ce nom. La valeur de la chaîne `"puppy"`,
  quant à elle, sera toujours `"puppy"`, tout comme la valeur de `3`
  sera toujours `3`.

- Enfin, si vous tentez d'utiliser un nom qui n'a pas été affecté à une
  valeur, Pyret affichera un message d'erreur. En revanche, rien ne vous
  empêche d'utiliser une chaîne qui n'a pas de nom.

## Expressions versus instructions

Entrez le code suivant dans l'aire de définition de Pyret, et exécutez
celui-ci :

```pyret
5 + 8
x = 14 + 16
triangle(20, "solid", "purple")
blue-circ = circle(x, "solid", "blue")
```

La première et la troisième ligne contiennent des expressions. La
deuxième et la quatrième ligne définissent des affectations. Jetez un
coup d'œil à l'aire d'interaction à droite où s'affichent les valeurs.
Que remarquez-vous ?

Les lignes où sont définies les affectations ne produisent pas de
valeur, alors que les autres si. En programmation, on distingue les
_expressions_, qui ont une valeur, des _instructions_, qui n'en ont pas.
Comme son nom l'indique, une instruction représente un ordre donné à
l'ordinateur. Pour l'instant, définir une affectation est la seule
instruction que l'on connaît. Nous verrons plus tard qu'il y en a
d'autres.

Si vous écrivez sur une nouvelle ligne le nom `blue-circ` défini
précédemment, et que vous exécutez le programme de nouveau, vous
remarquerez que Pyret affiche une valeur. On en déduit qu'une
affectation est une expression puisque celle-ci produit une valeur.
Attention de ne pas mélanger l'action de _définir_ une affectation, et
celle d'_utiliser_ l'affectation. La première est une instruction tandis
que la seconde est une expression.

## Environnement

Quoique les instructions ne donnent pas de valeur, quelque chose se
produit tout de même quelque part lorsqu'on les exécute. À quoi bon les
écrire sinon !

Lorsqu'on exécute une ligne sur laquelle est définie une nouvelle
affectation, Pyret ajoute dans un registre interne une entrée qui
associe le nom et la valeur. On appelle ce registre l'_environnement_.

Si on exécute l'instruction suivante, par exemple :

```pyret
width = 30
```

Pyret crée une entrée dans l'environnement où est enregistrée
l'affectation de `width` à la valeur `30`.

Si, ensuite, on exécute l'instruction ci-dessous :

```pyret
height = width * 3
```

Pyret évalue l'expression qui se trouve à droite du `=`, puis sauvegarde
dans l'environnement le résultat (`90`) sous le nom `height`.

Comment l'expression `width * 3` est-elle évaluée ? Pyret commence par
retrouver la valeur de `width` dans l'environnement : `30`. Le nom est
ensuite remplacé par sa valeur, et l'expression `30 * 3` qui en résulte
est enfin évaluée.

Voici à quoi ressemble l'environnement après avoir exécuté les deux
instructions :

```
width → 30
height → 90
```

Notez bien que l'entrée pour `height` pointe vers la _valeur_ de
`width * 3`, et non vers l'expression elle-même. Cette distinction est
d'autant plus importante lorsqu'on utilise les affectations pour
décortiquer les différentes étapes d'une opération complexe.

Que se passe-t-il si on tente d'affecter une nouvelle valeur à un nom
qui a déjà été défini ? Essayez par exemple d'affecter le nom `width` à
la valeur `50`. Pyret affichera un message d'erreur selon lequel la
nouvelle définition « est dans l'ombre » (_shadows_, en anglais) de
l'ancienne. Dans notre environnement d'apprentissage, il est impossible
de changer la valeur à laquelle est associée un nom. On appelle parfois
ce genre d'affectation une _constante_.

## Comprendre l'exécution d'un programme

Considérons le programme suivant :

```pyret
width = 30
height = width * 3
blue-rect = rectangle(width, height, "solid", "blue")
```

Comment se déroule son exécution ? Lorsqu'on clique sur le bouton RUN,
Pyret commence par réinitialiser l'environnement. Toutes les affectations
qui étaient précédemment sauvegardées en mémoire sont effacées. Ensuite,
le programme est traité ligne par ligne, du haut vers le bas.

Voici à quoi ressemble alors l'environnement :

```
circle → <fonction pour créer un cercle>
rectangle → <function pour créer un rectangle>
...
width → 30
height → 90
blue-rect → <image du rectangle>
```

## Quand nommer une valeur

Abstraire des valeurs en leur donnant un nom est une capacité importante
car elle permet de faciliter la lecture d'expressions composées. Il
n'est pas nécessaire de tout nommer. On donnera un nom aux expressions
complexes ou aux valeurs qui ont une signification particulière.

Le nom d'une valeur devrait indiquer ce qu'elle représente, et non le
type de donné qu'elle contient. On s'abstiendra donc de nommer une
valeur `x` ou `img`. Pareillement, on fera attention aux abréviations,
qui peuvent porter à confusion. Gardez toujours à l'esprit les futur·es
lecteurs et lectrices de votre programme.

Prenons par exemple l'expression ci-dessous, qui superpose un triangle
mauve tourné à 45 degrés sur un rectangle vert:

```pyret
overlay(
  rotate(45, triangle(30, "solid", "purple")),
  rectangle(60, 60, "solid", "green"))
```

Ce code est difficile à lire, n'est-ce pas ? Pour le comprendre, il faut
garder à l'esprit ce que fait indépendemment chacune des
sous-expressions, puis combiner leur résultat.

La lecture serait plus facile si on donnait un nom à chaque forme
géométrique.

```pyret
purple-tri = rotate(45, triangle(30, "solid", "purple"))
green-sqr = rectangle(60, 60, "solid", "green")

overlay(purple-tri, green-sqr)
```

De plus, nommer les valeurs nous permet de réutiliser celles-ci sans
avoir à réécrire l'expression au complet.

```pyret
above(green-sqr, overlay(purple-tri, green-sqr))
```
