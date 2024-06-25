# Les tests automatisés

Vous avez peut-être déjà remarqué que tester les fonctions est une tâche
laborieuse. Bien qu'il soit facile d'exécuter les fonctions dans l'aire
d'interaction, il faut le faire pour chaque changement apporté, et pour
toutes les combinaisons d'arguments à tester. À mesure qu'un programme
gagne en complexité, tester celui-ci devient un travail accablant, de
sorte que plusieurs programmeur·ses le néglige. Or, les tests sont la
seule façon d'assurer la robustesse d'un programme.

La création de *tests automatisés* permet de résoudre ces problèmes en
partie. Un test automatisé est un test qui est enregistré avec le
programme, et qui est exécuté à chaque fois qu'un changement est apporté
à celui-ci. Non seulement rendent-ils le processus de test plus
agréable, mais ils permettent de documenter le programme. Ainsi, le ou
la prochaine programmeuse qui lira le code saura quels sont les
résultats attendus pour chacune des fonctions.

La majorité des langages de programmation inclut un *cadre de test* qui
facilite l'écriture de tests automatisés. Peu importe le langage, le
fonctionnement de ces cadres est généralement similaire : étant donné
une certaine opération, on *affirme* (*assert*, en anglais) la valeur du
résultat. Dans notre langage de programmation, cette affirmation prend
la forme suivante : 

```
(check-expect opération valeur-attendue)
```

Considérons par exemple une fonction ayant pour but de convertir une
température en degrées Fahrenheit en son équivalent en degrées Celsius.

```racket
;; Number -> Number
;; Convertit une température en Fahrenheit en son équivalent en Celsius.
;; étant donné : 32, attend : 0
;; étant donné : 212, attend : 100
;; étant donné : -40, attend : -40
(define (fahrenheit->celcius température)
  (* 5/9 (- température 32)))
```

Pour tester cette fonction, il suffit de remplacer chaque exemple par un
test.

```racket
;; Number -> Number
;; Convertit une température en Fahrenheit en son équivalent en Celsius.
(define (fahrenheit->celcius température)
  (* 5/9 (- température 32)))

(check-expect (fahrenheit->celcius 32) 0)
(check-expect (fahrenheit->celcius 212) 100)
(check-expect (fahrenheit->celcius -40) -40)
```

Maintenant, à chaque fois que vous exécutez le programme (lorsque vous
cliquez sur le bouton *RUN*), DrRacket s'assurera que le résultat de
l'opération est équivalent à la valeur attendue. Si ce n'est pas le cas,
une fenêtre apparaîtra vous indiquant quel test a échoué, et quel est le
résultat actuel de l'opération fautive.

## Quand tester une fonction

Les tests qui vérifient le bon fonctionnement d'une fonction devraient
être écris au même moment d'écrire la fonction, et non après, une fois
que le programme est terminé. Dans notre cas, nous remplacerons
simplement l'étape six de notre méthode de conception (construire des
exemples) par l'écriture des tests. Les nouvelles étapes pour concevoir
une fonction sont donc :

1.  Identifier les informations
2.  Définir les données
3.  Écrire la signature
4.  Décrire le but 
5.  Rédiger l'entête
6.  Construire des tests
7.  Collecter les données
8.  Coder
