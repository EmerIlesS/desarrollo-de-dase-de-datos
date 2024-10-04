DROP DATABASE IF EXISTS appRaices;
CREATE DATABASE IF NOT EXISTS appRaices;
USE appRaices;

CREATE TABLE users(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50),  
  email VARCHAR(30),
  createdAt datetime,
  updateAt datetime
);

CREATE TABLE languages(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  languageName VARCHAR(15),
  community VARCHAR(15), 
  `description` TINYTEXT,
  createdAt datetime,
  updateAt datetime
);

CREATE TABLE lessons(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idLanguage INT,
  title VARCHAR(15),
  level INT,
  description TINYTEXT,
  FOREIGN KEY(idLanguage) REFERENCES languages(id),
  createdAt datetime,
  updateAt datetime
);

CREATE TABLE content(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idLesson INT, 
  description TINYTEXT,
  FOREIGN KEY(idLesson) REFERENCES lessons(id),
  createdAt datetime,
  updateAt datetime
);

CREATE TABLE progress(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idUser INT,
  idLesson INT,
  initDate DATE,
  endDate DATE,
  state VARCHAR(2),
  createdAt datetime,
  updateAt datetime,
  FOREIGN KEY(idUser) REFERENCES users(id),
  FOREIGN KEY(idLesson) REFERENCES lessons(id)
);

CREATE TABLE userProgress(
  ids INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  idUser INT,
  idProgress INT,
  
  FOREIGN KEY(idUser) REFERENCES users(id),
  FOREIGN KEY(idProgress) REFERENCES progress(id)
);

CREATE TABLE contributions(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idUser INT,
  idLanguage INT,
  `description` TINYTEXT,
  contributionDate DATETIME,
  FOREIGN KEY(idUser) REFERENCES users(id),
  FOREIGN KEY(idLanguage) REFERENCES languages(id)
);
