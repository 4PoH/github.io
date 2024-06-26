/* CREATION DE LA BASE DE DONNEES */

CREATE TABLE Muscle(
   ID_MUSCLE INTEGER,
   Nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_MUSCLE),
   UNIQUE(Nom)
);

CREATE TABLE Exercice(
   ID_EXERCICE INTEGER,
   Nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_EXERCICE),
   UNIQUE(Nom)
);

CREATE TABLE Users(
   ID_USER INTEGER,
   Name VARCHAR(20) NOT NULL,
   Password VARCHAR(30) NOT NULL,
   PRIMARY KEY(ID_USER),
   UNIQUE(Name)
);

CREATE TABLE Mesure(
   ID_Mesure INTEGER,
   Zone VARCHAR(50) NOT NULL,
   Mesure DECIMAL(5,2) NOT NULL,
   Jour DATE NOT NULL,
   ID_USER INT NOT NULL,
   PRIMARY KEY(ID_Mesure),
   UNIQUE(Zone),
   UNIQUE(Mesure),
   UNIQUE(Jour),
   FOREIGN KEY(ID_USER) REFERENCES Users(ID_USER)
);

CREATE TABLE Post(
   ID_POST INTEGER,
   Image VARCHAR(50),
   Commentaire VARCHAR(280),
   ID_USER INT NOT NULL,
   PRIMARY KEY(ID_POST),
   UNIQUE(Image),
   UNIQUE(Commentaire),
   FOREIGN KEY(ID_USER) REFERENCES Users(ID_USER)
);

CREATE TABLE Faire(
   ID_EXERCICE INT,
   ID_USER INT,
   Date_exercice DATE NOT NULL,
   Répétition SMALLINT,
   Poids DECIMAL(5,2),
   Duree SMALLINT,
   Distance DECIMAL(5,2),
   PRIMARY KEY(ID_EXERCICE, ID_USER),
   FOREIGN KEY(ID_EXERCICE) REFERENCES Exercice(ID_EXERCICE),
   FOREIGN KEY(ID_USER) REFERENCES Users(ID_USER)
);

CREATE TABLE Intervenir(
   ID_MUSCLE INT,
   ID_EXERCICE INT,
   PRIMARY KEY(ID_MUSCLE, ID_EXERCICE),
   FOREIGN KEY(ID_MUSCLE) REFERENCES Muscle(ID_MUSCLE),
   FOREIGN KEY(ID_EXERCICE) REFERENCES Exercice(ID_EXERCICE)
);

CREATE TABLE Commente(
   ID_USER INT,
   ID_POST INT,
   Commentaire VARCHAR(50),
   PRIMARY KEY(ID_USER, ID_POST),
   FOREIGN KEY(ID_USER) REFERENCES Users(ID_USER),
   FOREIGN KEY(ID_POST) REFERENCES Post(ID_POST)
);
