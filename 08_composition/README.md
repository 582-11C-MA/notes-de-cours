# La composition de fonctions

Un programme est rarement fait d'une seule fonction. En général, un
programme se compose d'une *fonction principale* et de plusieurs
*fonctions auxiliaires*. Ces fonctions auxiliaires permettent de séparer
le programme en plusieurs morceaux indépendants. On peut donc se
concentrer sur une partie du problème à la fois, sans avoir à ce soucier
du reste. Une fois définies, les fonctions auxiliaires sont appelées à
partir de la fonction principale, laquelle produit la valeur de sortie
du programme.

Comment savoir quand créer une fonction auxiliaire ? On suivra la règle
suivante :

    Définissez une fonction par tâche.

En suivant cette règle, vous obtiendrai des fonctions raisonnablement
courtes, dont il est facile de comprendre le fonctionnement. Il est
d'ailleurs beaucoup plus agréable de tester et de déboguer des petites
fonctions que des grandes. Mieux encore, si vous devez un jour modifier
le programme, il est beaucoup facile de remplacer une fonction
auxiliaire par une autre que de changer un long bloc de code
monolithique. Ce principe par lequel un programme est composé de 
petites pièces interchangeables se nomme « composition ».

Prenez par exemple une fonction qui permet de calculer le total d'une
facture étant donné le prix d'un produit, la quantité achetée, ainsi
qu'un tarif et une distance de livraison. Pour connaître le total,
plusieurs tâches doivent être accomplies :

1.  Multiplier le prix du produit par la quantité.
2.  Calculer les frais de livraison.
3.  Additionner le tout.

Pour chacune des deux premières tâches, on définira une fonction
auxiliaire. La seule tâche de la fonction principale sera d'additionner
le résultat des fonctions auxiliaires.

```racket
(define (combined-cost price quantity)
  (* price quantity))

(define (shipping rate distance)
  (* rate distance))

(define (total price quantity rate distance)
  (+ (combined-cost price quantity)
     (shipping rate distance)))

(total 10 25 0.25 100)
```

Vous remarquerez que le nom des paramètres de la fonction principale
`total` correspondent à ceux des fonctions auxiliaires. C'est souvent le
cas, mais ce n'est pas obligatoire. N'oubliez pas que les paramètres
d'une fonction sont des variables qui ont une portée locales ; ils sont
isolés de l'environnement extérieur de la fonction. 

Si le fonctionnement du code ci-haut vous cause de la confusion, copiez
celui-ci dans DrRacket, appliquez la fonction `total` à des arguments
quelconques, et cliquez sur le bouton *STEP*.

## Les constantes globales 

Une fonction permet de généraliser une opération afin que celle-ci
puisse être effectuée avec plusieurs valeurs différentes. Toutefois, les
valeurs d'un problème ne changent pas toutes. Certaines valeurs sont
*constantes* : le nombre d'heure dans une journée, l'age de la majorité,
le salaire minimum, etc. Lorsqu'on rencontre de telles valeurs
constantes dans un énoncé de problème, il est important de les
identifier, et de les nommer dans notre programme.

```racket
(define HOURS-PER-DAY 24)
(define MAJORITY-AGE 18)
(define MINIMUM-AGE 15.75)
```

On appelle ces variables des *constantes globales*, et il est
coutume de les écrire en lettres majuscules afin de pouvoir les
distinguer facilement. Comme ces constantes sont globales, ont peut les
utiliser dans toutes les fonctions d'un programme, sans avoir à les
passer comme argument.

**Attention** : Une même valeur peut être constante dans un problème et
ne pas l'être dans un autre problème. Le prix d'un billet de théâtre,
par exemple, peut être une constante dans le contexte d'un énoncé où le
prix ne change pas, mais il peut aussi être le paramètre d'une fonction
qui calcule la variation du prix dans le temps. Tout dépend de l'énoncé
du problème.
