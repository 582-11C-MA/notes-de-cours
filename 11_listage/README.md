# Listage

Définir une classe de données en français permet d'y inclure des
contraintes qu'il serait autrement difficile de spécifier. 

## Les énumérations

Certaines informations prennent la forme d'un ensemble fini de valeurs
possibles. On appelle ces informations des *énumérations*. Considérons
un programme qui doit gérer un feu de circulation routière. Les feux
sont généralement déclinés en trois couleurs : le rouge pour fermer, le
vert (ou parfois le bleu) pour ouvrir, et le jaune-orangé pour signaler
le passage du feu vert au feu rouge. La donnée qui représente l'état
actuel du feu de circulation a donc trois valeurs possibles : rouge,
vert, ou jaune-orangé.

Pour représenter ce genre d'information, on définira une *sous-classe*
pour chaque possibilité.

```racket
;; Un ÉtatFeu est une Chaîne parmis les suivantes :
;; - "rouge"
;; - "vert"
;; - "jaune"
;; interprétation : couleur actuelle du feu de circulation
```

Selon cette définition, `"rouge"` est une des valeurs possibles de
`ÉtatFeu`, alors que `"red"` ou `"r"` ne le sont pas. 

Il aurait aussi été possible d'utiliser des nombres pour représenter les
trois états du feu. Dans ce cas, on s'assurera de spécifier
l'interprétation de chaque valeur possible, et de leur assigner un nom
dans le programme.

```racket
;; Un ÉtatFeu est un Nombre parmis les suivants :
;; - 1 interprétation : le feu est rouge
;; - 2 interprétation : le feu est vert
;; - 3 interprétation : le feu est jaune

(define ROUGE 1)
(define VERT 2)
(define JAUNE 3)
```

Le corps des fonctions qui consomment une valeur appartenant à une
classe de données de type « énumération » prend la forme d'une
expression conditionnelle où chaque clause correspond à une sous-classe.
Le gabarit de conception à utiliser pour ce genre de fonction reflètera
donc l'organisation de l'énumération.

```racket
;; ÉtatFeu -> ÉtatFeu
;; Détermine la prochaine couleur d'un feu de circulation.
(define (prochaine-couleur couleur-actuelle)
  (cond ((... couleur-actuelle "rouge") ...)
        ((... couleur-actuelle "vert") ...)
        ((... couleur-actuelle "jaune") ...)))
```

Vous remarquerez que le gabarit de la fonction `prochaine-couleur`
contient trois clauses puisque la définition de donnée pour `ÉtatFeu`
contient trois sous-classes.

```racket
;; ÉtatFeu -> ÉtatFeu
;; Détermine la prochaine couleur d'un feu de circulation.
(define (prochaine-couleur couleur-actuelle)
  (cond ((string=? couleur-actuelle "rouge") "vert")
        ((string=? couleur-actuelle "vert") "jaune")
        ((string=? couleur-actuelle "jaune") "rouge")))
```

## Les intervalles

D'autres informations prennent la forme d'un ensemble de nombre compris
entre une borne inférieure et une borne supérieure. On appelle ce type
d'information un *intervalle*. Considérons par exemple la note de
passage d'un cours. La borne inférieure est 60 alors que la borne
supérieure est 100. Une note comprise dans l'intervalle entre ces deux
bornes sera une des valeurs possibles de la classe `NotePassage`.

```racket
;; Une NotePassage est un Nombre compris entre 60 et 100.
```

On distinguera les intervalles selon si leurs bornes sont incluses ou
non dans l'intervalle. Ainsi, un intervalle est dit *fermé* si il
n'inclut pas ces bornes, et *ouvert* dans le cas contraire. Un
intervalle peut aussi être *semi-ouvert* à gauche ou à droite si il
inclut seulement sa borne inférieure ou supérieure.

Lorsqu'on conçoit une fonction qui consomme une valeur appartenant à une
classe de données de type « intervalle », on prendra soins de tester la
fonction avec des arguments qui correspondent aux bornes de
l'intervalle.
