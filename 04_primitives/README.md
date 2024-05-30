![langage](https://people.eecs.berkeley.edu/~bh/ss-pics/farside.jpg)

# Les valeurs primitives

Tous les langages de programmation possèdent des *valeurs primitives*
qui permettent de représenter les *informations* du monde réel sous une
forme que l'ordinateur comprend, ainsi que des *procédures natives*
grâce auxquelles ses valeurs primitives peuvent être manipulées. C'est
le travail du ou de la programmeuse d'apprendre à assembler ces valeurs
et ces opérations de base de sorte à pouvoir décrire des situations
complexes.

Il existe plusieurs *types* de valeurs primitives, chacun pouvant
représenter différentes sortes d'information. Un programme dont la tâche
est de convertir une température Celsius en une température Fahrenheit,
par exemple, travaillera avec des *nombres*. Un programme qui doit
stocker le nom des étudiant·es d'une école travaillera avec des *chaînes
de caractères*. Tandis qu'un programme qui implique n'importe quelle
sorte de décision travaillera avec des *booléens*. Bien sûr, certains
programmes nécessiteront plus d'un type de valeur.

Vous trouverez ci-dessous une description de ces types de valeurs
primitives, ainsi que certaines des procédures natives qui permettent de
les manipuler.

## Les nombres

Commençons avec les nombres. Notre langage de programmation distingue
plusieurs types de nombres, dont les entiers ou *integers* en anglais
(`1`), les rationnels (`1/2` ou `0.5`), et les réels (`0.33333...`). 
En général, on rassemblera cependant tous ces types sous la famille
`number`.

### Les procédures natives des nombres

Pour manipuler ces nombres, notre version de Racket rend disponible
plusieurs opérations mathématiques de base : addition (`+`),
soustraction (`-`), multiplication (`*`), division (`/`). Il est aussi
possible de calculer la valeur absolue d'un nombre (`abs`), le minimum
et le maximum d'une série de nombres (`min` et `max`), ou le reste d'une
division (`remainder`). Ces dernières opérations s'appliquent de la même
façons que les premières ; c'est à dire, comme nous l'avons vu au
chapitre précédent, à l'aide des parenthèses.

```racket
> (abs -10)
10
> (min 5 100 25)
5
> (remainder 11 2)
1
```

Vous trouverez [ici][documentation procédures natives] une liste des
procédures natives qui peuvent être appliquées sur les nombres.

[documentation procédures natives]:
https://docs.racket-lang.org/htdp-langs/beginner.html#%28part._htdp-beginner._.Numbers__.Integers__.Rationals__.Reals__.Complex__.Exacts__.Inexacts%29

## Les chaînes de caractères

Une chaîne (*string*, en anglais) est une séquence de caractères
entourée de guillemets anglais double. C'est avec ce type de valeur
qu'il est possible de représenter des lettre, des mots, des phrases,
etc.

```racket
> "h"
"h"
> "hello"
"hello"
> "hello world"
"hello world"
> "(+ 1 2 3)"
"(+ 1 2 3)"
```

Portez une attention particulière à la dernière expression. Vous
remarquerez que le résultat n'est pas 6. Tout ce qui est à l'intérieur
d'une chaîne de caractère n'est pas évalué.

### Les procédures natives des chaînes

Notre langage d'apprentissage inclus une procédure qui permet de joindre
bout à bout plusieurs chaînes de caractères : `string-append`.

```racket
> (string-append "pro" "gramme")
"programme"
> (string-append "pro" "gram" "ma" "tion")
"programmation"
```

**Attention** : Lorsque nous additionnons les nombres `5` et `10`, le
résultat est un troisième nombre : `15`. L'expression `(+ 5 10)` ne
*change pas* la valeur des opérandes `5` et `10` ; `15` représente une
nouvelle valeur. Il en va de même pour toutes les procédures de notre
langage d'apprentissage. Par exemple, l'expression `(string-append "Ra"
"cket")` modifie ni la chaîne `"Ra"` ni la chaîne `"cket"`. Le résultat
de l'opération est une troisième chaîne : `"Racket"`.

Il existe d'autres procédures qui interagissent avec les chaînes. Par
exemple, `string-length` retourne le nombre de caractères que contient
une chaîne.

```racket
> (string-length "boo")
3
> (string-length "New York")
8
```

Vous remarquerez que la procédure `string-length` s'applique sur une
chaîne, mais que son résultat est un nombre. Certaines procédures
s'appliquent sur une chaîne *et* un nombre. C'est le cas de `string-ith`
qui, étant donné une chaîne et un nombre, produira le caractère qui se
trouve à la position qui correspond au nombre donné.

```racket
> (string-ith "abc" 1)
"b"
```

Pourquoi la valeur de l'expression ci-haut est `"b"` et non `"a"` ?
Lorsqu'il est question de *position*, la majorité des langages de
programmation compte à partir de zéro. 

```
"abc"
 012
```

Ainsi, le caractère à la position 0 est `"a"`, celui à la position 1 est
`"b"`, et `"c"` est à la position 2. Un truc est de voir plutôt le
deuxième opérande (`1`) de l'expression `(string-ith "abc" 1)` comme le
nombre de caractères à *sauter*. L'expression se lit donc : quel est le
caractère *après* le premier ?

Pour certaines procédures comme `string-ith`, l'*ordre* des opérandes est
important. Si vous inversez `"abc"` et `1`, DrRacket affichera une
erreur dans l'aire d'interaction.

```racket
> (string-ith 1 "abc")
string-ith: expected a string for the first argument, but received 1
```

DrRacket affichera un message similaire si vous essayer d'appliquer une
procédure sur une valeur du mauvais type.

```racket
> (+ "chaîne" "de" "caractères")
+: expects a number, given "chaîne"
> (string-append 1 2 3)
string-append: expects a string, given 1
```

## Convertir d'un type à un autre

Notre langage offre aussi des procédures pour convertir un type de
valeur en un autre type de valeur.

```racket
> (number->string 1)
"1"
> (string->number "1")
1
```

**Attention** : La *chaîne* `"1"` et le *nombre* `1` ne sont pas
équivalents. La chaîne `"1"` représente le *chiffre* un (c'est-à-dire le
caractère arabe utilisé pour représenter l'idée du nombre un). On
pourrait également représenter l'idée du nombre un avec le chiffre
romain `"I"`.

## Les booléens

Dans notre langage d'apprentissage, il existe seulement deux valeurs de
type booléen : `#true` et `#false`. Un programme utilise souvent un
booléen pour représenter une information ayant seulement deux valeurs
possibles : « oui » ou « non », « allumé » ou « éteint », « vrai » ou 
« faux », etc.

### Les procédures natives des booléens

Plusieurs procédures natives produisent des booléens, mais seulement
trois permettent de manipuler les booléens : `or`, `and`, `not`.

Une expression dont l'opérateur est `or` produit `#true` si un des
opérandes est `#true`. 

```racket
> (or #true #true)
#true
> (or #true #false)
#true
> (or #false #true)
#true
> (or #false #false)
#false
```

Une expression dont l'opérateur est `and` produit `#true` seulement si
*tous* ses opérandes sont `#true`.

```racket
> (and #true #true)
#true
> (and #true #false)
#false
> (and #false #true)
#false
> (and #false #false)
#false
```

Une expression dont l'opérateur est `not` produit le contraire du
booléen donné.

```racket
> (not #true)
#false
> (not #false)
#true
```

### Les prédicats

Une procédure qui produit un booléen porte le nom de « prédicat ». En
plus des prédicats ci-haut qui s'appliquent sur les booléens, notre
langage de programmation contient plusieurs exemples de prédicats qui
permettre de comparer les nombres.

```racket
> (< 1 3)
#true
> (> 10 5)
#true
> (<= 3 3)
#true
> (= 1 1)
#true
```

Il existe également des prédicats qui permettent de comparer les chaînes
de caractères. Une expression dont l'opérateur est `string=?` produit
`#true` si toutes les chaînes données sont identiques. Une expression
dont l'opérateur est `string<=?` produit `#true` si les deux chaînes
données sont en ordre lexicographique croissant (1, 2, 3, A, B, C, a, b,
c). Une expression dont l'opérateur est `string>=?` produit `#true` si
les deux chaînes données sont en ordre lexicographique décroissant.

```racket
> (string=? "bleu" "bleu")
#true
> (string=? "bleu" "vert")
#false
> (string<=? "Algérie" "Canada")
#true
> (string<=? "Pologne" "Brésil")
#false
> (string>=? "Chine" "Japon")
#false
```

Pour chaque type de valeur primitive, notre langage fournit un prédicat
qui permet de vérifier si une valeur appartient ou non à ce type. Ainsi,
une expression dont l'opérateur est `number?` et dont l'opérande est un
nombre produit `#true`.

```racket
> (number? 5)
#true
> (number? "five")
#false
> (string? "apple")
#true
> (string? 45)
#false
```

Vous remarquerez que le nom de la majorité des prédicats se termine par
un point d'interrogation. On suivra également cette convention lorsque
nous écrirons nos propres prédicats dans quelques séances.
