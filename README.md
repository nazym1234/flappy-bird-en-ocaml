# Flappy OCaml

Ce projet est une implémentation simplifiée de Flappy Bird en OCaml en utilisant un moteur physique rudimentaire.

## Description

Ce programme simule un oiseau (Flappy) qui peut sauter et se déplacer horizontalement. L'objectif est d'éviter des obstacles générés aléatoirement en contrôlant la hauteur de vol de Flappy. Le jeu inclut un sol, un plafond et un système de score basique.

## Fonctionnalités

- **Moteur de jeu** : Le programme utilise une boucle de jeu (`loop`) qui met à jour la physique et l'affichage à chaque itération.
- **Flappy** : Représenté par un simple symbole `"()"`, il a une largeur définie et est soumis à la gravité.
- **Sol et plafond** : Définis comme des lignes solides (`#`) qui encadrent la zone de jeu.
- **Obstacles** : Générés aléatoirement en haut et en bas de l'écran sous forme de tuyaux.
- **Déplacement** :
  - Appuyer sur `z` fait sauter Flappy.
  - Appuyer sur `d` permet un déplacement vers la droite.
- **Gestion des collisions** : Les obstacles et les limites sont pris en compte dans la mise à jour de l'état du jeu.

## Structure du Code

- **Initialisation**
  - Définition de `flappy`, du sol, du plafond et du score.
  - Génération des obstacles de manière aléatoire.
- **Mécanique du jeu**
  - `update` : Met à jour la position de Flappy et génère les obstacles si nécessaire.
  - `affiche` : Gère l'affichage des éléments du jeu.
- **Utilisation de la physique**
  - Gravité appliquée sur Flappy.
  - Détection des collisions.

## Installation et Exécution

Assurez-vous d'avoir OCaml installé sur votre machine.

1. Installez OCaml :
   ```sh
   sudo apt install ocaml ocaml-findlib
