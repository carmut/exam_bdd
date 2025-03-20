-- question 1
-- creatation de la base de donnée
CREATE DATABASE IF NOT EXISTS `bibliotheque` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- creation des tables
USE `bibliotheque`;
CREATE TABLE IF NOT EXISTS `adherents`(
    id_adherent INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    date_inscription DATE NOT NULL,
    a_surveiller BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS `livres`(
    isbn BIGINT PRIMARY KEY NOT NULL,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    annee_publication DATE NOT NULL,
    disponible BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS `emprunts`(
    id_adherent INT NOT NULL,
    isbn BIGINT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE NOT NULL,
    FOREIGN KEY (id_adherent) REFERENCES adherents(id_adherent),
    FOREIGN KEY (isbn) REFERENCES livres(isbn)
);

-- question 2
-- creation de l'utilisateur 'bibliothecaire avec le mot de passe 'secret'
CREATE USER IF NOT EXISTS 'bibliothecaire'@'localhost';
ALTER USER 'bibliothecaire'@'localhost' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON `bibliotheque`.* TO 'bibliothecaire'@'localhost';
FLUSH PRIVILEGES;

-- question 3
-- insertion des données

-- insertion des adherents
INSERT INTO `adherents`(`nom`, `adresse`, `date_inscription`, `a_surveiller`) VALUES
('Jane Austen','10 rue de la tables, BDD_ville','2025-01-20',false),
('Charles Dickens','11 rue de la tables, BDD_ville','2025-01-20',false),
('Jules Verne','12 rue de la tables, BDD_ville','2025-01-20',false),
('Mary shelley','13 rue de la tables, BDD_ville','2025-01-20',false);

-- insertion des livres
INSERT INTO `livres`('isbn',`titre`, `auteur`, `annee_publication`, `disponible`) VALUES
('9780141439518','Orgueil et Préjugés','Pezet Piotre','1980-06-15',true),
('9780192816092','David Copperfield','Pezet Piotre','1980-06-15',true),
('9780194238021','Vingt mile lieues sous les mers','Pezet Piotre','1980-06-15',true),
('9780520201798','Frankenstein','Pezet Piotre','1980-06-15',true);

-- insertion des emprunts
INSERT INTO `emprunts`(`id_adherent`, `isbn`, `date_emprunt`, `date_retour`) VALUES
('1', '9780141439518', '2025-04-10', '2025-05-10'),
('1', '9780192816092', '2025-05-11', '2025-06-10'),
('1', '9780194238021', '2025-06-12', '2025-07-10'),
('1', '9780520201798', '2025-07-13', '2025-08-10'),

('2', '9780141439518', '2025-04-10', '2025-05-10'),
('2', '9780192816092', '2025-05-11', '2025-06-10'),
('2', '9780194238021', '2025-06-12', '2025-07-10'),
('2', '9780520201798', '2025-07-13', '2025-08-10'),

('3', '9780141439518', '2025-04-10', '2025-05-10'),
('3', '9780192816092', '2025-05-11', '2025-06-10'),
('3', '9780194238021', '2025-06-12', '2025-07-10'),
('3', '9780520201798', '2025-07-13', '2025-08-10'),

('4', '9780141439518', '2025-04-10', '2025-05-10'),
('4', '9780192816092', '2025-05-11', '2025-06-10'),
('4', '9780194238021', '2025-06-12', '2025-07-10'),
('4', '9780520201798', '2025-07-13', '2025-08-10');


-- question 4
-- changement de l'adresse pour charles dickens
UPDATE `adherents` SET `adresse` = '14 rue de la tables, BDD_ville, Londres' WHERE `id` = '2';

-- question 5
-- creation de la vue livre retard +30 jours
CREATE VIEW `retard` AS 
SELECT adherents.nom, livres.titre, DATEDIFF(date_inscription, date_retour) AS `retard`
FROM `adherents`
JOIN `emprunts` ON adherents.id_adherent = emprunts.id_adherent
JOIN `livres` ON emprunts.isbn = livres.isbn
HAVING retard > 30;

--question 6
CREATE VIEW retard AS


-- question 9
-- on pourrais mettre un index sur <livres.auteur> car il s'agit d'un champs souvent utiliser, cela permettrait de gagner du temps 

