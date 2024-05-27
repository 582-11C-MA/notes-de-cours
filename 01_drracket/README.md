![xkcd comic](https://imgs.xkcd.com/comics/lisp_cycles.png)

# Racket

Le langage de programmation utilisé pour les deux premières parties du
cours se nomme « Racket ». Racket est un descendant de Scheme (un autre
langage de programmation), lequel est un dialecte Lisp (un des plus
vieux langages de programmation). Ceci dit, ce cours n'est pas *à
propos* de Racket. En fait, la syntaxe de Racket (c'est-à-dire sa
grammaire ; les règles de son écriture) est si simple que l'apprendre
nécessite une heure au plus.

## DrRacket

DrRacket est un environment graphique pour développer des programmes
écrits en Racket. Il n'est pas nécessaire d'utiliser DrRacket pour
programmer en Racket, mais DrRacket facilite son installation et fournit
plusieurs outils qui aide son apprentissage. 

Pour télécharger DrRacket, cliquez [ici][installation].

[installation]: https://download.racket-lang.org

### Langages d'enseignement

Il est écrit ci-haut que le langage de programmation utilisé dans ce
cours est Racket. Techniquement, nous utiliserons plutôt un sous-langage
d'enseignement *tiré* de Racket. Pour activer ce langage, il suffit
d'aller dans le menu *Langages* de DrRacket, de choisir *Sélectionner le
langage*, puis, sous la section *How to Design Programs*, de cliquer sur
*Étudiant débutant*.

### Utilisation

DrRacket contient une *aire de définition* (par défaut, la partie
supérieure) et une *aire d'interaction* (par défaut, la partie
inférieure).

#### Aire de définition

L'aire de définition permet d'écrire un programme et de sauvegarder
celui-ci dans un fichier texte (par exemple, « fizzbuzz.rkt »). À
quelques exceptions prêt, cette partie de DrRacket fonctionne comme
n'importe quel autre éditeur de texte.

#### Aire d'interaction

Le ou la programmeuse rédige ses programmes à l'aide d'un éditeur de
texte. Racket étant un langage de programmation interactif, il est
toutefois possible de « dialoguer » avec l'ordinateur (ou, pour être
plus précis, avec l'*évaluateur* Racket). L'aire d'interaction est
l'endroit où se passe se dialogue. Si vous cliquez sur le bouton *Run*,
le résultat des expressions écrites dans l'aire de définition y sera
affiché.

Il est également possible d'entrer des expressions directement dans
l'aire d'interaction. Pour ce faire, placez votre curseur après
l'*invite de commande* (le caractère `>`), entrez une expression au
clavier, puis pesez sur la touche *Retour*. Le résultat s'affichera sur
la ligne suivante.

**Attention** : Le code que vous entrez dans l'aire d'interaction n'est
pas enregistré.
