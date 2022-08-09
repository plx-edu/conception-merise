CREATE TABLE Individu(
  code_individu VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  adresse VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  prenom VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  nom VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  date_naissance DATE,
  PRIMARY KEY(code_individu)
);

CREATE TABLE Formateur(
  code_formateur COUNTER,
  code_individu VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(code_formateur),
  UNIQUE(code_individu),
  FOREIGN KEY(code_individu) REFERENCES Individu(code_individu)
);

CREATE TABLE Apprenant(
  code_apprenant COUNTER,
  code_individu VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(code_apprenant),
  UNIQUE(code_individu),
  FOREIGN KEY(code_individu) REFERENCES Individu(code_individu)
);

CREATE TABLE Formation(
  code_formation VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  titre VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  date_creation DATETIME NOT NULL,
  date_publication DATETIME,
  code_formateur INT NOT NULL,
  PRIMARY KEY(code_formation),
  FOREIGN KEY(code_formateur) REFERENCES Formateur(code_formateur)
);

CREATE TABLE Lesson(
  code_lesson VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  intitule VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  objectif VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  contenu_texte VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  contenu_image VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  contenu_video VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  duree VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  code_formateur INT NOT NULL,
  PRIMARY KEY(code_lesson),
  FOREIGN KEY(code_formateur) REFERENCES Formateur(code_formateur)
);

CREATE TABLE Tag(
  code_tag VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  valeur VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(code_tag)
);

CREATE TABLE avoir(
  code_formation VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  code_lesson VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  status LOGICAL NOT NULL,
  PRIMARY KEY(code_formation, code_lesson),
  FOREIGN KEY(code_formation) REFERENCES Formation(code_formation),
  FOREIGN KEY(code_lesson) REFERENCES Lesson(code_lesson)
);

CREATE TABLE suivre(
  code_apprenant INT,
  code_formation VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY(code_apprenant, code_formation),
  FOREIGN KEY(code_apprenant) REFERENCES Apprenant(code_apprenant),
  FOREIGN KEY(code_formation) REFERENCES Formation(code_formation)
);

CREATE TABLE contenir(
  code_lesson VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  code_tag VARCHAR(50) COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY(code_lesson, code_tag),
  FOREIGN KEY(code_lesson) REFERENCES Lesson(code_lesson),
  FOREIGN KEY(code_tag) REFERENCES Tag(code_tag)
);
