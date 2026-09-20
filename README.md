# Flappy Bird en OCaml

Implémentation pédagogique d’un jeu inspiré de Flappy Bird, réalisée en OCaml avec un moteur d’affichage et de physique textuel.

## Fonctionnalités

- oiseau soumis à la gravité ;
- saut contrôlé au clavier ;
- déplacement horizontal ;
- génération aléatoire de tuyaux ;
- collisions avec le sol, le plafond et les obstacles ;
- système de score ;
- boucle de mise à jour et rendu textuel.

## Commandes

- `D` : démarrer ou avancer horizontalement ;
- `Z` : faire sauter l’oiseau.

## Code

Le jeu se trouve dans `flappybird.ml`. Il utilise un module externe nommé `Engine` pour le rendu, les entrées clavier et la physique.

## État du dépôt

> Le fichier du moteur `Engine` n’est pas présent dans ce dépôt. Le code illustre donc la logique complète du jeu, mais ne peut pas être compilé seul sans le moteur fourni dans le cadre pédagogique d’origine.

Avec le module `Engine` disponible, la compilation peut être effectuée avec l’outil OCaml adapté au projet d’origine.

## Notions abordées

Programmation fonctionnelle, récursivité, listes, état de jeu, boucle événementielle, génération procédurale simple et gestion des collisions.
