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
    founded_year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des joueurs
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT,
    nationality VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE SET NULL
);

-- Table des matchs
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    match_date TIMESTAMP NOT NULL,
    stadium VARCHAR(100),
    result VARCHAR(10),  -- Ex: "2-1", "1-1", "0-3"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (home_team_id) REFERENCES teams(id) ON DELETE CASCADE,
    FOREIGN KEY (away_team_id) REFERENCES teams(id) ON DELETE CASCADE
);

-- Table des scores
CREATE TABLE match_scores (
    id SERIAL PRIMARY KEY,
    match_id INT NOT NULL,
    team_id INT NOT NULL,
    goals INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
);

-- Insertion d'exemples d'équipes
INSERT INTO teams (name, city, stadium, coach, founded_year) VALUES
('FC Barcelona', 'Barcelone', 'Camp Nou', 'Xavi Hernández', 2021),
('Real Madrid', 'Madrid', 'Santiago Bernabéu', 'Carlo Ancelotti', 2022),
('Paris Saint-Germain', 'Paris', 'Parc des Princes', 'Luis Enrique', 2025);

-- Insertion de joueurs
INSERT INTO players (name, age, position, team_id, nationality) VALUES
('Lionel Messi', 36, 'Attaquant', 1, 'Argentine'),
('Karim Benzema', 36, 'Attaquant', 2, 'France'),
('Kylian Mbappé', 25, 'Attaquant', 3, 'France');

-- Insertion de matchs
INSERT INTO matches (home_team_id, away_team_id, match_date, stadium, result) VALUES
(1, 2, '2024-03-10 20:00:00', 'Camp Nou', '2-1'),
(3, 1, '2024-03-15 21:00:00', 'Parc des Princes', '1-1');

-- Insertion des scores
INSERT INTO match_scores (match_id, team_id, goals) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 1, 1);
