# La conception de programmes

Programmer, ce n'est pas simplement écrire du code. C'est transformer un
énoncé de problème en un programme. Pour ce faire, il faut identifier ce
qui est pertinent dans l'énoncé, et ce qui peut être ignoré. Il faut
repérer les informations que le programme va consommer, et les
informations que le programme doit produire. Il faut traduire ces
informations en données que notre langage de programmation peut traiter.
Il faut savoir si notre langage de programmation fournit les opérations
nécessaires pour que le programme puisse traiter les données. Si ce
n'est pas le cas, il faut concevoir nous même les procédures pour
effectuer ces opérations. Enfin, une fois le programme terminé, il faut
tester celui-ci, et s'assurer qu'il fonctionne comme prévu. Ces tests
peuvent révéler des erreurs, lesquelles il faut être capable de
comprendre et de corriger.

Jusqu'à présent, vous avez traversé ces étapes à tâtons, en
expérimentant ici et là, et en laissant les choses telles lorsque les
résultats semblaient corrects. Nous présentons ici une méthode de
travail qui permet plutôt de concevoir des programmes de manière
systématique. 

## 1. Identifier les informations

Un programme consomme des informations et produit de nouvelles
informations. Ces informations proviennent d'un domaine en particulier
du monde réel. Par exemple, un programme de météo travaillera avec des
informations reliées à la température et la localisation, tandis qu'un
programme qui gère un catalogue de meubles devra reconnaître la
différence entre une commode à cinq tiroirs et une table carrée de deux
mètres sur deux.

Pour concevoir un programme, le ou la programmeuse doit comprendre le
domaine du problème, et traduire les informations de l'énoncé sous une
forme que l'ordinateur comprend. Or, la seule chose qu'un ordinateur
comprend, ce sont les données. Pour qu'un programme puisse consommer et
produire des informations, il faut donc traduire celles-ci en données,
puis, une fois traitées, les traduire de nouveau en informations.
Autrement dit, il faut choisir comment *représenter* les informations
sous forme de données, et comment *interpréter* les données en tant
qu'informations.

![Représenter des informations et interpréter des
données](representer-interpreter.png)

## 2. Définir les données

Puisque cette traduction est cruciale pour concevoir et comprendre un
programme, on l'inclura à même le programme sous la forme de
*définitions de données*. Ces définitions de données permettront de
nommer les différentes catégories ou classes de données, et d'informer
les lecteur·ices sur la manière de les inclure et de les repérer dans le
programme. 

Dans notre langage d'apprentissage, une définition de données est
présentée sous forme de commentaire au début du programme. Par exemple,
voici une définition de données pour la température :

```racket
;; Une Température est un Nombre.
;; interprétation : degrées Celsius 
```

La première ligne indique le nom de la classe de données en majuscules
(`Température`), suivi du type de valeurs choisi pour représenter
l'information (`Nombre`). On essayera de choisir un seul mot, deux tout
au plus, pour nommer une classe. Selon la définition ci-haut, le nombre
`102` est donc une température alors que la chaîne `"froid"` ne l'est
pas. Une même information peut être représentée différemment selon
l'énoncé du problème. 

La deuxième ligne indique comment interpréter la donnée. Dans l'exemple
ci-haut, la valeur `20` représente potentiellement une température
puisque `20` est un nombre. Or, il n'est pas question de 20
températures. Il n'est pas question de 20 chatons non plus. Plutôt, on
interpréta la valeur `20` comme étant 20 *degrées Celsius*. 

Vous remarquerez qu'une classe de données n'est rien de plus qu'un alias
pour un des types de valeurs primitives (nombre, booléen, chaîne). Comme
nous utilisons simplement le français pour décrire la classe de données,
il est toutefois possible d'ajouter plus de détails à notre définition.
Par exemple, on peut restreindre les valeurs possibles pour une classe
de données.

```racket
;; Une Date est un Nombre entre 1 et 31.
;; interprétation : le jour du mois
```

## 3. Écrire la signature de la fonction

Une fois que vous avez décidé comment représenter les informations du
domaine de l'énoncé et comment interpréter les données du programme, il
est temps d'écrire la ou les fonctions qui permettront d'effectuer les
opérations nécessaires pour résoudre le problème. On suggère de
commencer avec la fonction principale, puis, au fur et à mesure que de
nouvelles tâches apparaissent, d'ajouter les fonctions auxiliaires.

Dans tous les cas, l'ajout d'une fonction au programme commence toujours
par l'écriture de sa *signature*. La signature identifie le ou les types
de données que consomme la fonction, ainsi que le type de données que la
fonction produit. Par exemple, voici la signature d'une fonction ayant
un paramètre de type `Chaîne`, et une valeur de retour de type `Nombre`.

```racket
;; Chaîne -> Nombre
```

On peut également utiliser dans la signature d'une fonction les classes
de données que nous avons définies à l'étape précédente. Voici par
exemple la signature d'une fonction ayant un paramètre de type
`Température`, un second paramètre de type `Date`, et une valeur de
retour de type `Booléen`.

```racket
;; Température Date -> Booléen
```

## 4. Décrire le but de la fonction

Le but d'une fonction est une courte phrase (une ligne ou deux au
maximum) qui énonce à quoi sert celle-ci. La phrase devrait répondre à
la question suivante : Qu'est-ce que calcule la fonction ? N'importe qui
devrait pouvoir lire cette phrase, et comprendre ce que la fonction
produit sans avoir à lire son corps.

```racket
;; Date -> Température
;; Retourne la température prévue pour la date donnée.
```

Le but d'une fonction commence par un verbe conjugué à la troisième
personne du singulier. Par convention, on utilise l'adjectif « donné »
(*given*, en anglais) pour identifier à l'intérieur de la phrase le ou
les paramètres de la fonction.

## 5. Rédiger l'entête de la fonction

Une fois que vous avez écris la signature et le but de la fonction, il
est temps de rédiger son entête. Comme nous avons vu précédemment,
l'entête d'une fonction contient son nom ainsi que le nom de ses
paramètres. Évidemment, l'entête de la fonction doit concorder avec sa
signature.

```racket
;; Nombre -> Nombre
;; Calcule le carré de la base donnée.
(define (power base) 4)
```

Afin d'éviter les erreurs lors de l'exécution du code, on remplacera
pour l'instant le corps de la fonction par une valeur dont le type
correspond à celui qu'est sensé produire la fonction.

## 6. Construire des exemples

La prochaine étape consiste à illustrer le fonctionnement attendu de la
fonction à l'aide d'exemples. Chaque exemple documentera, étant donné
certains arguments, la valeur de retour attendue.

```racket
;; Mot -> Mot
;; Retourne le mot donné au pluriel.
;; étant donné : "pomme", attend : "pommes"
;; étant donné : "animal", attend : "animaux"
;; étant donné : "caillou", attend : "cailloux"
(define (pluriel mot) "pommes")
```

On placera chaque exemple sur une ligne différente, et on suivra la
formule suivante : 

    étant donné : <argument>, attend : <valeur-de-sortie>

## 7. Collecter les données

La dernière étape avant de commencer à coder est de remplacer le corps
de la fonction par un *gabarit*, et d'insérer dans celui-ci toutes les
données nécessaires pour l'opération que doit effectuer la fonction. Ces
données incluront au minimum les paramètres de la fonction, mais aussi
les constantes dont la fonction a besoin pour calculer le résultat. 

```racket
(define MAJORITY 18)

;; Age -> Booléen
;; Retourne #vrai si l'age donné correspond à la majorité.
;; étant donné : 16, attend : #false
;; étant donné : 24, attend : #true
;; étant donné : 18, attend : #true
(define (adult? age)
  (... age MAJORITY))
```

On utilise les points de suspension (`...`) pour indiquer que le corps
de la fonction est présentement incomplet. Le gabarit ci-haut est plutôt
ennuyeux, mais nous introduirons des gabarits plus utiles sous peu.

## 8. Coder

Enfin, c'est le temps de coder, c'est-à-dire de remplacer les points de
suspension par les expressions qui permettront de produire les valeurs
attendues.

```racket
(define MAJORITY 18)

;; Age -> Booléen
;; Retourne #vrai si l'age donné correspond à la majorité.
;; étant donné : 16, attend : #false
;; étant donné : 24, attend : #true
;; étant donné : 18, attend : #true
(define (adult? age)
  (>= age MAJORITY))
```

## 9. Tester la fonction

La dernière étape consiste à tester la fonction à l'aide des exemples
construits à l'étape 6. Pour ce faire, appliquez la fonction aux
arguments donnés pour chaque exemple, et assurez que la valeur de sortie
de la fonction correspond à la valeur attendue.


```racket
(adult? 16) ; => #false
(adult? 24) ; => #true
(adult? 18) ; => #true
```

Si le résultat ne correspond pas à la valeur attendue, considérez les
deux possibilités suivantes : 

1.  La valeur attendue n'est pas la bonne. Dans ce cas, assurez-vous que
    les exemples ne contiennent pas d'erreurs.
2.  Le corps de la fonction est faux. Autrement dit, vous êtes face à
    une erreur de logique, aussi connue sous le nom de « *bug* ». Dans
    ce cas, utilisez le débogueur de DrRacket (le bouton *STEP*) pour
    identifier l'erreur.
