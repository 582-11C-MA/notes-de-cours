# Valeurs de base

Imaginez que vous travaillez dans un studio de graphisme, et que l'on
vous demande de générer à l'aide d'un programme des icônes pour les
drapeaux des pays du monde. L'image ci-dessous contient quelques
exemples des images que votre programme devra créées.

![Drapeaux](flags.excalidraw.png)

Avant de se lancer dans l'écriture du code, prenons un moment pour
observer ces drapeaux, et identifier les caractéristiques qui pourraient
nous aider dans notre démarche. Prenez un crayon, et écrivez sur un
papier vos observations.

> [!NOTE]\
> Prenez toujours le temps d'examiner un problème avant de vous lancer
> dans l'écriture du code. Savoir discerner les caractéristiques et les
> motifs qui se trouvent dans un énoncé est une compétence essentielle
> en programmation.

Voici quelques uns des détails que vous avez peut-être remarqués :

- Certains drapeaux ont une structure similaire, mais leurs couleurs
  sont différentes.
- Les drapeaux n'ont pas tous la même taille.
- Tous les drapeaux sont de forme rectangulaire.
- Certains drapeaux incluent un cercle.
- Un des drapeaux a un mât.

Ces observations nous donnent des indices quant aux tâches que notre
programme devra accomplir :

- Définir les dimensions du drapeau, et calculer la taille des bandes et
  des cercles. Pour ce faire, on devra manipuler des _nombres_.
- Définir la couleurs des différentes composantes du drapeau. Pour ce
  faire, on utilisera des _chaînes de caractères_.
- Créer un drapeaux en combinant des formes de différentes couleurs.
  Pour ce faire, nous devrons créer et combiner des _expressions_.

Maintenant que notre plan de travail est tracé, commençons !

## Nombres

Débutons avec une opération simple : calculer la somme de 3 et 5.

Pour effectuer ce calcul avec un ordinateur, on doit communiquer à
celui-ci notre intention. Jusqu'à présent, pour demander à votre
ordinateur d'effectuer une tâche, vous avez utilisé des _interfaces
graphiques_ faites de boutons et de champs texte. En programmation, on
utilise plutôt des _langages de programmation_ comme PHP, Python, ou
JavaScript. Les règles de ces langages étant strictes et complexes, on
commence parfois par décrire notre programme dans un langage informel
appelé _pseudo-code_. Puisqu'il n'y a pas de norme précise quant à
l'écriture du pseudo-code, on peut réfléchir à la structure du programme
sans ce soucier des règles de syntaxe.

La simplicité du pseudo-code en fait un bon outil apprentissage. Pour
exprimer l'opération « calculer la somme de 3 et 5 » par exemple, on
écrit simplement le code suivant :

```pyret
3 + 5
```

Habituellement, le pseudo-code n'est pas lu par l'ordinateur. On ne peut
donc pas vérifier si notre programme contient des erreurs, ni afficher
son résultat à l'écran. Or pour que vous puissiez avoir du plaisir tout
en apprenant les bases de la programmation, nous utiliserons dans ce
cours un environnement d'apprentissage web qui permet d'exécuter le
pseudo-code. Le nom de cet environnement est _Pyret_ (prononcé comme le
mot « pirate »). Vous pouvez accéder à Pyret en cliquant sur le lien
suivant : https://code.pyret.org/editor.

> [!NOTE]\
> Dans les notes de cours, les termes « pseudo-code » et « code » sont
> utilisés indifféremment. Puisqu'il n'existe pas de convention pour le
> pseudo-code, la ligne entre les deux est ambiguë. La syntaxe utilisée
> pour la première partie du cours se rapproche davantage des langages
> de programmation que du langage naturel afin de faciliter la
> transition vers PHP à la deuxième partie.

Recopiez le code précédent dans Pyret dans l'aire de texte à gauche. On
appelle cette partie de Pyret l'_aire de définition_. C'est dans l'aire
de définition qu'on écrit le code.

Cliquez ensuite sur le bouton RUN en haut à droite, ou appuyez sur les
touches CTRL + RETURN de votre clavier. Vous verrez le résultat de
l'opération s'afficher dans la partie droite de Pyret, appelée l'_aire
d'interaction_. C'est dans l'aire d'interaction que Pyret affiche le
résultat de votre code, ainsi que les erreurs, s'il y en a.

Remplacez le code précédent par l'opération ci-dessous, puis exécutez de
nouveau le programme à l'aide du bouton RUN ou des touches CTRL +
RETURN.

```pyret
3 + 4 * 5
```

Vous remarquerez que Pyret affiche dans l'aire d'interaction à droite
une notice de couleur rouge. Cette notice est une _erreur_. Lorsque
Pyret est incapable de comprendre votre code, il produit un message
d'erreur qui explique le problème.

Lisez attentivement le message d'erreur. Êtes-vous capable de résoudre
le problème par vous-même ? Essayez de corriger le code, et exécutez le
de nouveau. Si le problème est résolu, le message d'erreur disparaîtra,
et Pyret affichera le résultat du programme.

> [!NOTE]\
> Un programme est rarement correct la première fois qu'on l'écrit. Un
> ou une bonne programmeuse n'est pas une personne qui ne fait pas
> d'erreurs, mais plutôt quelqu'un qui sait repérer et régler celles-ci.
> On appelle cet art « déboguer ».

Si vous ne comprenez pas le message d'erreur, ne vous en faites pas ;
cela demande de la pratique. Voici le problème : dans notre version du
pseudo-code, il n'y a pas de priorité des opérations comme en
mathématiques, où la multiplication est calculée avant l'addition. Pyret
ne sait donc pas si vous désirez multiplier 7 et 5, ou additionner 3
et 20. Pour éviter cette ambiguïté, on doit ajouter des parenthèses.

```pyret
(3 + 4) * 5
```

Une autre règle : il faut toujours une espace à gauche et à droite des
opérateurs mathématiques comme `+` et `*`. Cela facilite la lecture du
code lorsqu'il y a plusieurs opérateurs. Essayez par exemple d'exécuter
l'opération ci-dessous, et vous obtiendrai un message d'erreur
différent.

```pyret
3+4
```

> [!NOTE]\
> Toutes ces erreurs peuvent vous sembler embêtantes. Peut-être
> serez-vous tenté·e de les ignorer. On vous conseille toutefois de
> régler les erreurs au fur et à mesure qu'elles apparaissent.

On peut utiliser le pseudo-code pour exprimer des opérations plus
complexes que l'addition et la multiplication. Notre but est de produire
des drapeaux, après tout !

Disons par exemple qu'on veuille calculer le minimum de deux nombres. Il
suffit d'invoquer le nom de l'opération, et d'écrire entre parenthèses
les nombres sur lesquels effectuer celle-ci.

```pyret
num-min(2, 8)
```

Puisque le pseudo-code n'est pas fait pour être lu par l'ordinateur, on
peut théoriquement utiliser n'importe quel nom pour invoquer une
opération. Si vous voulez afficher le résultat dans notre environnement
d'apprentissage, il faudra cependant invoquer le nom d'une opération
connue de Pyret. Si vous tentez d'exécuter l'expression `minimum(1, 2)`,
un message d'erreur vous indiquera que le nom `minimum` n'est pas
défini. Tout comme `*` est l'opérateur utilisé pour se référer à
l'opération de multiplier deux nombres, `num-min` est l'opérateur pour
l'opération de calculer le minimum. Nous verrons plus tard où trouver la
liste des opérations possibles dans notre environnement d'apprentissage.

Si vous exécutez le code précédent dans Pyret, vous remarquerez que son
résultat est un nombre, comme c'était le cas pour l'addition et la
division. Essayons de combiner ces opérations :

```pyret
5 * num-min(2, 8)
```

Le résultat devrait être 10 ; le minimum de 2 et 8 est 2, et 5 multiplié
par 2 donne 10.

Essayons de combiner encore plus d'opérations :

```pyret
(1 + 5) * num-min(2, 8)
```

> [!NOTE]\
> Si vous avez de la difficulté à lire un bout de code, commencez par
> calculer la valeur des expressions les plus simples (`1 + 5` et
> `num-min(2, 8)`). Combinez ensuite leurs valeurs .

Ces deux exemples montrent qu'on peut construire des opérations
complexes à partir d'opérations plus simples.

## Terminologie

Considérons l'exemple suivant :

```pyret
(3 + 4) * num-max(2, 8)
```

Ce code contient différentes sortes d'éléments. En programmation, ces
éléments portent des noms particuliers. Voici leur définition :

- _Expression_ : question posée à l'ordinateur dont le résultat est une
  valeur. Par exemple, `3 + 4` et `num-max(2, 8)` sont des expressions.
  La combinaison de plusieurs expressions est aussi considérée comme une
  expression.

- _Valeur_ : expression qui ne peut pas être réduite davantage. Par
  exemple, `3` et `8` sont des valeurs.

- _Fonction_ : synonyme d'« opération ». Par exemple, `num-max` est une
  fonction. Les termes « opération » et « fonction » peuvent être
  utilisés de façon interchangeable, mais en programmation on préfère
  généralement « fonction ».

- _Argument_ : valeur d'entrée donnée à une fonction. Par exemple, `3`
  et `8` sont des arguments données à la fonction `num-max`.

## Chaînes de caractères

En plus des nombres, notre programme pour générer des drapeaux devra
aussi se référer au nom des couleurs. Pour manipuler des noms et autres
types d'information textuelle, on utilise des _chaînes de caractères_.
Voici quelques exemples :

```pyret
"Kathi"
"Go Bears!"
"CSCI0111"
"Carberry, Josiah"
```

Comme son nom l'indique, une chaîne de caractères est une séquence de
caractères entourée de guillemets anglais (`"`). Une chaîne peut
contenir des espaces, de la ponctuation, et des chiffres. Les chaînes de
caractères sont sensible à la casse, c'est-à-dire que `"red"` et `"Red"`
sont deux chaînes différentes.

## Images

Nous avons vu deux types de valeur : les nombres et les chaînes de
caractères. Pour produire des drapeaux, il nous faudra aussi des images.
Dans notre environnement d'apprentissage, pour générer une image, on
peut invoquer le nom d'une forme géométrique, puis donner sa taille, son
remplissage, et sa couleur.

```pyret
circle(30, "solid", "red")
rectangle(20, 10, "outline", "purple")
```

Vous remarquerez qu'on utilise des fonctions pour produire les formes,
et que l'apparence de ces formes est configurée à l'aide de nombres et
de chaînes.

### Combiner les images

Nous avons vu précédemment que les opérateurs mathématiques comme `+` et
`*` peuvent être utilisés pour combiner des nombres et former des
expressions plus complexes. En programmation, chaque type de données a
ses propres opérations. Il n'est pas possible d'additionner ni de
multiplier les images, mais on peut les pivoter, changer leur taille,
les placer côte à côté, et ainsi de suite.

Voyons quelques exemples. Recopiez les expressions suivantes dans Pyret,
et jouez avec les valeurs pour comprendre ce que chaque argument
représente.

```pyret
rotate(45, rectangle(20, 30, "solid", "red"))
```

Que représente le nombre `45` ? Essayez de remplacer `45` par
différentes valeurs afin de confirmer votre hypothèse.

```pyret
overlay(circle(25, "solid", "yellow"), rectangle(50, 50, "solid", "blue"))
```

Que fait la fonction `overlay` ?

```pyret
above(circle(25, "solid", "red"), rectangle(30, 50, "solid", "blue"))
```

Quel type de valeur produisent les opérations `above` et `overlay` ?
Votre réponse devrait être soit nombre, chaîne ou image.

Ces exemples nous permettent de réfléchir un peu plus en profondeur aux
expressions. Le code ci-dessus contient des valeurs simples comme des
nombres et des chaînes de caractères. Il contient aussi des opérations
ou des fonctions comme `+` et `rotate` qui combinent ces valeurs. De
plus, chaque fonction produit une valeur de sortie, laquelle peut être
utilisée comme la valeur d'entrée d'une autre fonction.

En programmation, l'idée d'assembler ainsi les valeurs de sortie et
d'entrée des fonction porte un nom précis : la _composition_. Tous les
programmes intéressants résultent de cette composition de différentes
opérations. Se familiariser avec cette idée est une étape importante
dans l'apprentissage de la programmation.

## Types et contrat

Maintenant que vous êtes capable de combiner des fonctions pour
construire des expressions complexes, arrêtons-nous un moment pour
observer quelles sont les combinaisons qui sont permises et celles qui
ne le sont pas.

Considérons par exemple l'expression suivante :

```pyret
8 * circle(25, "solid", "red")
```

Quelle type de valeur obtiendra-t-on ? La multiplication s'applique
normalement aux nombres, mais on multiplie ici un nombre par une image.
Est-ce que cela a un sens ? Bien sûr que non. Pyret affichera d'ailleurs
le message d'erreur ci-dessous.

> The * operator expects to be given two Numbers

Remarquez le mot « _Numbers_ ». Pyret nous indique quel type de valeur
peut être manipulé avec l'opérateur `*`. En programmation, les valeurs
sont organisées selon leur _type_ : nombre, chaîne, image, etc. Ces
types servent à indiquer la ou les sortes de valeurs avec lesquelles une
fonction peut travailler, et la sorte de valeurs qu'elle produit.
L'opérateur `*`, par exemple, s'attend à recevoir deux nombres, et il
renverra toujours un nombre. Voilà pourquoi Pyret affiche une erreur ;
car notre expression enfreint cette règle.

Les règles qui dictent le type des valeurs d'entrée et de sortie forment
ce qu'on appelle le _contrat_ d'une fonction. Il existe plusieurs
notations pour écrire un contrat, mais le principe général reste le
même. Voici par exemple le contrat de certaines fonctions vues jusqu'à
présent :

```
circle :: (radius :: Number, mode :: String, color :: String) -> Image
rotate :: (degrees :: Number, img :: Image) -> Image
overlay :: (upper-img :: Image, lower-img :: Image) -> Image
```

Prenez un moment pour observer ces exemples. Êtes-vous capable
d'identifier les différentes parties d'un contrat ? Examinons ensemble
celui de la fonction `overlay`. Voici les informations qu'il contient :

- Il existe une fonction nommée `overlay`.
- Elle prend deux valeurs d'entrée de type `Image`.
- La première (`upper-img`) est l'image qui apparaîtra au dessus.
- La deuxième (`lower-img`) est l'image qui apparaîtra en dessous.
- Elle renvoie une valeur de sortie de type `Image`.

Un contrat commence donc par le nom de la fonction, suivi de ses valeurs
d'entrée entre parenthèse. Puisque les valeurs d'entrée servent à
configurer la fonction, on les appelle des _paramètres_. Les paramètres
sont séparés par une virgule.

> [!NOTE]\
> Quelle est la différence entre un _paramètre_ et un _argument_ ? Un
> paramètre indique la valeur d'entrée à laquelle une fonction s'attend.
> Un argument est la valeur d'entrée que l'on donne lorsqu'on appelle la
> fonction. Les deux termes font référence à la même valeur, mais à
> différents moments.

Les doubles deux-points (`::`) introduisent une _annotation de type_.
Ces annotation servent à indiquer le type d'un élément. Par convention,
la première lettre du type est toujours en majuscule.

> [!NOTE]\
> Vous vous demandez peut-être pourquoi le nom de la fonction est suivi
> d'une paire de deux-points si ceux-ci servent indiquer le type d'un
> élément. Nous verrons plus tard qu'une fonction est aussi un type de
> valeur, tout comme `String` ou `Image`.

Enfin, la flèche (`->`) indique le type de la valeur de sortie.

Voici donc la forme générale d'un contrat :

```
nom :: (paramètre-1 :: Type, paramètre-2 :: Type) -> Type-sortie
```

Un contrat indique également l'_arité_ d'une fonction, c'est-à-dire son
nombre de paramètres (ou de valeurs d'entrée attendues). Le contrat de
la fonction `circle`, par exemple, a trois paramètres :

1. un premier de type `Number` pour le rayon (_radius_, en anglais),
2. un second de type `String` pour le mode de remplissage, et
3. un troisième de type `String` pour la couleur.

Que se passe-t-il si le nombre d'arguments que l'on donne à une fonction
ne correspond pas au nombre de paramètres indiqué dans son contrat ?
Essayez par exemple d'exécuter le code suivant dans Pyret.

```pyret
circle(100, "purple")
```

Vous verrez apparaître dans l'aire d'intéraction le message d'erreur
ci-dessous.

> 2 arguments were passed to the operator.\
> The operator evaluated to a function accepting 3 parameters.\
> An application expression expects the number of parameters and
> arguments to be the same.

Pyret nous indique que seulement deux arguments ont été donnés à la
fonction `circle`, alors que son contrat dit qu'il en faut trois.
