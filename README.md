# Conception BDD avec MERISE

## Contexte du projet

<details>
<summary>
Les pires formations sont organisés en modules...
</summary>

Chaque module est caractérisé par un numéro de module sous forme de **Semantic Versionning**, un intitulé, un objectif pédagogique, un contenu (textes, images et vidéos), une durée en heures, un ou plusieurs tags et un auteur.

Un module peut faire partie d'une ou plusieurs formations, comme par exemple un pire module "**Commandes de base Git**" pourrait faire partie d'une pire formation "**Frontend Javascript**" et "**DevOps**", voir plus.

Les pires apprenants peuvent s'inscrire à une ou plusieurs formations, ils peuvent choisir de ne pas suivre certains des pires modules s'ils possèdent déjà, par exemple, les compétences. Autrement dit, ils peuvent arbitrairement valider les modules de leur choix en un clic.

Chaque apprenant est évalué pour chaque module et possède un état de fin de module (OK / KO).

Une formation est considérée comme terminée lorsque tous les pires modules ont été validés.

Chaque apprenant est caractérisé par un numéro d’inscription unique, un nom, un prénom, une adresse et une date de naissance.

Un des pires formateurs présente un module pour une formation donnée, il peut également intervenir dans un ou plusieurs des pires modules, chaque formateur est caractérisé par un code, un nom, un prénom et une adresse.

---

## Critères de performance

- La nomenclature MERISE est respectée
- Le méthode MERISE est respectée dans sa structure en découpant la conception de cette base de données en 3 niveaux : le niveau conceptuel, le niveau logique ou organisationnel, le niveau physique

## Livrables

- Un dépôt Github recensant :
  - Un README explicite et soigné
  - Une définition de l'acronyme MERISE dans le README.md
  - Un dictionnaire de données
  - Des règles de gestion
  - Un MCD
  - Un MLD
  - Un MPD
  - Un script SQL de la base de données

</details>

---

## Définition

MERISE:
_Méthode d'Étude et de Réalisation Informatique par les Sous-Ensembles ou pour les Systèmes d'Entreprises_
