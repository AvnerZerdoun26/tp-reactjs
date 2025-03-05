CREATE DATABASE football_db;

-- Utilisation de la base de données
USE football_db;

-- Table des équipes
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100),
    stadium VARCHAR(100),
    coach VARCHAR(100),
    founded_year INT
);

-- Table des joueurs
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT,
    nationality VARCHAR(50),
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
);

-- Insertion de trois équipes
INSERT INTO teams (name, city, stadium, coach, founded_year) VALUES
('FC Barcelona', 'Barcelone', 'Camp Nou', 'Xavi Hernández', 1899),
('Real Madrid', 'Madrid', 'Santiago Bernabéu', 'Carlo Ancelotti', 1902),
('Paris Saint-Germain', 'Paris', 'Parc des Princes', 'Luis Enrique', 1970);

-- Insertion de trois joueurs par équipe
INSERT INTO players (name, age, position, team_id, nationality) VALUES
-- Joueurs du FC Barcelone
('Robert Lewandowski', 35, 'Attaquant', 1, 'Pologne'),
('Pedri', 21, 'Milieu', 1, 'Espagne'),
('Jules Koundé', 25, 'Défenseur', 1, 'France'),

-- Joueurs du Real Madrid
('Vinicius Jr', 23, 'Attaquant', 2, 'Brésil'),
('Jude Bellingham', 20, 'Milieu', 2, 'Angleterre'),
('Antonio Rüdiger', 30, 'Défenseur', 2, 'Allemagne'),

-- Joueurs du PSG
('Kylian Mbappé', 25, 'Attaquant', 3, 'France'),
('Marco Verratti', 31, 'Milieu', 3, 'Italie'),
('Marquinhos', 29, 'Défenseur', 3, 'Brésil');
