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
- [x] Des règles de gestion
- [x] Un dictionnaire de données
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

- Une **Formation** contient un titre, une date de création et de publication

  - elle est construite(gérer) par un _formateur_ (son auteur)
  - elle contient un ou plusieurs _modules_ (chapitres)
  - des _apprenants_ s'inscrivent pour suivre une ou plusieur formations
  - elle est validée lorsque tout les modules qui la compose sont validés

- Un **Module** (Lesson) contient un intitulé, un objectif, du contenu (texte et/ou image et/ou vidéo), une durée

  - est construit(rédiger) par un formateur
  - peut se trouver dans une ou plusieurs formations
  - contient un ou plusieurs **tag**
  - peut être validé, ou non, par un apprenant
    - à travers une formation
    - ou tel quel

- **Formateur** contient un code unique de formateur
- **Apprenant** contient un code unique d'apprenant

- Les formateurs et les apprenants ont ce types d'information en commun:
  - nom
  - prénom
  - adresse
  - date de naissance

---

## Dictionnaire de données

Le dictionnaire des données est un document qui regroupe toutes les données que vous aurez à conserver dans votre base (et qui figureront donc dans le MCD)

![Alt text](merise-dictionnaire_donnees.JPG?raw=true "Optional Title")

---

## MCD - Modèle Conceptuel de Données

Le but du MCD est de décrire de manière formelle les données d'un système d'information (SI). Le MCD décrit la sémantique, c’est-à-dire le sens, attachée à ces données et à leurs rapports, et non l’utilisation qui en est faite.

[Accéder au schéma MCD](/looping/MCD-conception-merise.JPG)

---

## MLD - Modèle Logique de Données

Le Modèle Logique de Données est la transformation du MCD en un ensemble de tables.
Il est généré à partir du MCD.

<details><summary>MLD Textuel</summary>

**Individu** = (code_individu VARCHAR(50), adresse VARCHAR(50), prenom VARCHAR(50), nom VARCHAR(50), date_naissance DATE);

**Formateur** = (code_formateur COUNTER, #code_individu);

**Apprenant** = (code_apprenant COUNTER, #code_individu);

**Formation** = (code_formation VARCHAR(50), titre VARCHAR(50), date_creation DATETIME, date_publication DATETIME, #code_formateur);

**Lesson** = (code_lesson VARCHAR(50), intitule VARCHAR(50), objectif VARCHAR(50), contenu_texte VARCHAR(50), contenu_image VARCHAR(50), contenu_video VARCHAR(50), duree VARCHAR(50), #code_formateur);

**Tag** = (code_tag VARCHAR(50), valeur VARCHAR(50));

**Chapitre** = (code_chapitre VARCHAR(50), num_chapitre VARCHAR(50), #code_lesson);

**suivre** = (#code_apprenant, #code_formation);

**contenir** = (#code_lesson, #code_tag);

**completer** = (#code_apprenant, #code_lesson, status LOGICAL);

**composer** = (#code_formation, #code_chapitre);

**valider** = (#code_apprenant, #code_chapitre, status LOGICAL);

</details>

[Accéder au schéma MLD](/looping/MLD-conception-merise.JPG)

---

## MPD - Modèle Physique de Données

Le Modèle Physique de Données est la transformation du MLD dans le format d'une base de données.

Le MPD est le schéma correspondant à une base de données spécifique : Oracle, MySQL, PostgreSQL, etc...

[Accéder au schéma MPD](/looping/MPD-conception-merise.JPG)

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
