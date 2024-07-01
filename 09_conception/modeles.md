# Modèles pour la conception de programme

Vous trouverez ci-dessous des modèles à utiliser pour suivre les étapes
de conception. Il suffit de choisir le bon modèle pour votre problème,
et de remplacer les mots entre crochets par les valeurs appropriées.

## Définition de données générale

```
;; Un <Classe> est un <Type>.
;; interprétation : <interprétation>
```

Une **classe** de données représente une information du monde réel : une
température, un montant d'argent, une quantité, une heure, un message,
une commande, etc. Pour représenter ces informations dans un programme,
il faut choisir le **type de valeur** approprié parmi ceux qu'offre
notre langage de programmation : chaîne, nombre, booléen, liste, etc. La
première lettre de la classe et du type doit être en majuscule.

Lorsqu'un programme produit une valeur, il faut savoir comment
interpréter celle-ci. Dans notre programme, que veut dire le nombre 
`25` ? Que veut dire la chaîne `"rouge"` ? Que veut dire le booléen
`#true` ? L'**interprétation** est donc la réponse à la question
suivante : Quelle est la signification d'une valeur qui fait partie de
la classe ?

### Examples

Définition de données pour un programme bancaire :

```
;; Un Solde est un Nombre.
;; interprétation : dollars présentement dans le compte
```

Définition de données pour un programme qui gère un inventaire
de vélos :

```
;; Une Couleur est une Chaîne.
;; interprétation : couleur du vélo
```

Définition de données pour un programme qui gère un forum de discussion
en ligne :

```
;; Un StatutModérateur est un Booléen.
;; interprétation : si l'utilisateur est un modérateur ou non
```

## Définition de données pour les intervalles

```
;; Un <Classe> est un Nombre entre <borne-inférieure> et <borne-supérieure>.
;; interprétation : <interprétation>
```

Certaines informations numériques peuvent être représentées seulement
par un ensemble de nombres compris entre une **borne inférieure** et une
**borne supérieure** : un taux, une note d'examen, une plage horaire,
etc. On s'assurera de préciser cette contrainte dans la définition de
données.

### Exemples

Définition de données pour un programme scolaire :

```
;; Une Note est un Nombre entre 0 et 10.
;; interprétation : note reçu à l'examen final
```

Définition de données pour une programme de recettes culinaires :

```
;; Une Température est un Nombre entre 100 et 500.
;; interprétation : degrés Fahrenheit
```

Définitions de données pour une programme qui gère des livraisons :

```
;; Une Heure est un Nombre entre 0 et 23.
;; interprétation : heure de la journée

;; Une PlageDeLivraison est une Heure entre 10 et 15.
;; interprétation : heure de livraison
```

## Définition de données pour les énumérations

```
;; Un <Classe> est un <Type> parmi :
;; - <valeur-possible>
;; - <valeur-possible>
;; - <...>
;; interprétation : <interprétation>
```

Certaines informations prennent la forme d'un ensemble prédéterminé de
**valeurs possibles** : les jours de la semaine (lundi, mardi, etc.), le
status d'une livraison (en préparation, en route, livrée), les enseignes
d'un jeu de cartes (trèfle, carreau, cœur, pique), les permissions
d'un·e utilisateur·rice (administrateur, éditeur, invité), etc.

On peut donner une interprétation pour toutes les valeurs, ou pour
chaque valeur possible (voir les exemples ci-dessous). 

### Exemples

Définition pour un programme qui manipule des dates :

```
;; Un Jour est une Chaîne parmi :
;; - "Lundi"
;; - "Mardi"
;; - "Mercredi"
;; - "Jeudi"
;; - "Vendredi"
;; - "Samedi"
;; - "Dimanche"
;; interprétation : jour de la semaine
```

Définition pour un programme utilisé dans une bibliothèque :

```
;; Un ÉtatLivre est un Nombre parmi :
;; - 0 interprétation : le livre est disponible
;; - 1 interprétation : le livre est emprunté
;; - 2 interprétation : le livre est reservé
```

Définition pour un programme qui traduit des notes en grades :

```
;; Un Grade est une Chaîne parmi :
;; - "A" interprétation : note entre 90 et 100
;; - "B" interprétation : note entre 80 et 90
;; - "C" interprétation : note entre 70 et 80
;; - "D" interprétation : note entre 60 et 70
;; - "E" interprétation : note entre 50 et 60
;; - "F" interprétation : note entre 0 et 50
```

## Définition de données pour les listes

```
;; Une <Liste> est soit :
;; - '()
;; - (cons <Type> <Liste>)
;; interprétation : <interprétation>
```

Une liste est soit une liste vide, soit une paire dont le deuxième
élément est une liste. Les informations qui prennent la forme d'une
liste sont donc des énumérations avec deux valeurs possibles. La
première valeur est toujours une liste vide. La deuxième valeur est une
paire dont la forme dépend de l'information représentée.

### Exemples

Définition de données pour un programme qui manipule des noms :

```
;; Une ListeDeNom est soit :
;; - '()
;; - (cons String ListeDeNom)
```

## Signature et but d'une fonction

```
;; <Type|Classe> <...> -> <Type|Classe>
;; <But>
(define (<nom> <paramètre> <...>) <corps>)
```

La **signature** décrit le type ou la classe de chacun des paramètres de
la fonction, ainsi que le type ou la classe de sa valeur de retour.

Le **but** est une courte phrase (une ligne ou deux au maximum) qui
énonce à quoi sert la fonction. Le but commence toujours par un verbe
conjugué à la troisième personne du singulier.
