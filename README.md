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

Un dépôt Github recensant :

- [x] Un README explicite et soigné
- [x] Une définition de l'acronyme MERISE dans le README.md
- [x] Un dictionnaire de données
- [ ] Des règles de gestion
- [x] Un MCD
- [x] Un MLD
- [x] Un MPD
- [x] Un script SQL de la base de données

</details>

---

## Définition

MERISE:
_Méthode d'Étude et de Réalisation Informatique par les Sous-Ensembles ou pour les Systèmes d'Entreprises_

---

## Règles de Gestion

Consiste à écrire en français (ou dans la langue de votre choix) une phrase décrivant comment sont associés les concepts.

- Une *Formation* contient un titre, une date de création et de publication
  - elle est construite(rédiger) par un formateur (son auteur)
  - elle contient un ou plusieurs modules
  - des apprenants s'inscrivent pour suivre une formation
  - elle est validée lorsque tout les modules sont validés

- Un *Module* (Lesson) contient un intitulé, un objectif, du contenu (texte et/ou image et/ou vidéo), une durée
  - il peut se trouver dans une ou plusieurs formation
  

---

## Dictionnaire de données
Le dictionnaire des données est un document qui regroupe toutes les données que vous aurez à conserver dans votre base (et qui figureront donc dans le MCD)

![Alt text](merise-dictionnaire_donnees.JPG?raw=true "Optional Title")

---
## MCD - Modèle Conceptuel de Données

Le but du MCD est de décrire de manière formelle les données d'un système d'information (SI). Le MCD décrit la sémantique, c’est-à-dire le sens, attachée à ces données et à leurs rapports, et non l’utilisation qui en est faite. 

[Accéder au fichier MCD](/looping/MCD-conception-merise.JPG)

---
## MLD - Modèle Logique de Données
Le Modèle Logique de Données est la transformation du MCD en un ensemble de tables.
Il est généré à partir du MCD. 

[Accéder au fichier MLD](/looping/MLD.txt)

---
## MPD - Modèle Physique de Données
Le Modèle Physique de Données est la transformation du MLD dans le format d'une base de données.

Le MPD est le schéma correspondant à une base de données spécifique : Oracle, MySQL, PostgreSQL, etc...

[Accéder au fichier MPD](/looping/MPD-conception-merise.JPG)

---
## Script SQL
Un MLD pourra générer plusieurs MPD, si vous décidez d'adapter votre base de données à votre client.

Le résultat final sera un script SQL qui permettra de créer la base dans le SGBDR.

[Accéder au script SQL](/looping/generated_sql.sql)

---
### Sources:

- https://www.devdesignbook.tiankod.fr/
- https://ineumann.developpez.com/tutoriels/merise/initiation-merise/

---

Merci d'avoir lu, à bientot
