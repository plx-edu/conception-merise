CREATE TABLE Individu(
  code_individu VARCHAR(50),
  adresse VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  nom VARCHAR(50) NOT NULL,
  date_naissance DATE NOT NULL,
  PRIMARY KEY(code_individu)
);

CREATE TABLE Formateur(
  code_formateur COUNTER,
  code_individu VARCHAR(50) NOT NULL,
  PRIMARY KEY(code_formateur),
  UNIQUE(code_individu),
  FOREIGN KEY(code_individu) REFERENCES Individu(code_individu)
);

CREATE TABLE Apprenant(
  code_apprenant COUNTER,
  code_individu VARCHAR(50) NOT NULL,
  PRIMARY KEY(code_apprenant),
  UNIQUE(code_individu),
  FOREIGN KEY(code_individu) REFERENCES Individu(code_individu)
);

CREATE TABLE Formation(
  code_formation VARCHAR(50),
  titre VARCHAR(50) NOT NULL,
  date_creation DATETIME NOT NULL,
  date_publication DATETIME,
  code_formateur INT NOT NULL,
  PRIMARY KEY(code_formation),
  FOREIGN KEY(code_formateur) REFERENCES Formateur(code_formateur)
);

CREATE TABLE Lesson(
  code_lesson VARCHAR(50),
  intitule VARCHAR(50) NOT NULL,
  objectif VARCHAR(50) NOT NULL,
  contenu_texte VARCHAR(50),
  contenu_image VARCHAR(50),
  contenu_video VARCHAR(50),
  duree VARCHAR(50) NOT NULL,
  code_formateur INT NOT NULL,
  PRIMARY KEY(code_lesson),
  FOREIGN KEY(code_formateur) REFERENCES Formateur(code_formateur)
);

CREATE TABLE Tag(
  code_tag VARCHAR(50),
  valeur VARCHAR(50) NOT NULL,
  PRIMARY KEY(code_tag)
);

CREATE TABLE Chapitre(
  code_chapitre VARCHAR(50),
  num_chapitre VARCHAR(50) NOT NULL,
  code_lesson VARCHAR(50) NOT NULL,
  PRIMARY KEY(code_chapitre),
  FOREIGN KEY(code_lesson) REFERENCES Lesson(code_lesson)
);

CREATE TABLE suivre(
  code_apprenant INT,
  code_formation VARCHAR(50),
  PRIMARY KEY(code_apprenant, code_formation),
  FOREIGN KEY(code_apprenant) REFERENCES Apprenant(code_apprenant),
  FOREIGN KEY(code_formation) REFERENCES Formation(code_formation)
);

CREATE TABLE contenir(
  code_lesson VARCHAR(50),
  code_tag VARCHAR(50),
  PRIMARY KEY(code_lesson, code_tag),
  FOREIGN KEY(code_lesson) REFERENCES Lesson(code_lesson),
  FOREIGN KEY(code_tag) REFERENCES Tag(code_tag)
);

CREATE TABLE completer(
  code_apprenant INT,
  code_lesson VARCHAR(50),
  status LOGICAL NOT NULL,
  PRIMARY KEY(code_apprenant, code_lesson),
  FOREIGN KEY(code_apprenant) REFERENCES Apprenant(code_apprenant),
  FOREIGN KEY(code_lesson) REFERENCES Lesson(code_lesson)
);

CREATE TABLE composer(
  code_formation VARCHAR(50),
  code_chapitre VARCHAR(50),
  PRIMARY KEY(code_formation, code_chapitre),
  FOREIGN KEY(code_formation) REFERENCES Formation(code_formation),
  FOREIGN KEY(code_chapitre) REFERENCES Chapitre(code_chapitre)
);

CREATE TABLE valider(
  code_apprenant INT,
  code_chapitre VARCHAR(50),
  status LOGICAL,
  PRIMARY KEY(code_apprenant, code_chapitre),
  FOREIGN KEY(code_apprenant) REFERENCES Apprenant(code_apprenant),
  FOREIGN KEY(code_chapitre) REFERENCES Chapitre(code_chapitre)
);
