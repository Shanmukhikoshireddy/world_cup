
-- PostgreSQL database dump

-- Drop existing database and create new one
DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;
\c worldcup;

-- Create tables
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR NOT NULL,
    winner_id INT NOT NULL REFERENCES teams(team_id),
    opponent_id INT NOT NULL REFERENCES teams(team_id),
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL
);

-- Insert data into teams
INSERT INTO teams(name) VALUES ('France');
INSERT INTO teams(name) VALUES ('Croatia');
INSERT INTO teams(name) VALUES ('Belgium');
INSERT INTO teams(name) VALUES ('England');
INSERT INTO teams(name) VALUES ('Russia');
INSERT INTO teams(name) VALUES ('Sweden');
INSERT INTO teams(name) VALUES ('Brazil');
INSERT INTO teams(name) VALUES ('Uruguay');
INSERT INTO teams(name) VALUES ('Colombia');
INSERT INTO teams(name) VALUES ('Switzerland');
INSERT INTO teams(name) VALUES ('Japan');
INSERT INTO teams(name) VALUES ('Mexico');
INSERT INTO teams(name) VALUES ('Denmark');
INSERT INTO teams(name) VALUES ('Spain');
INSERT INTO teams(name) VALUES ('Portugal');
INSERT INTO teams(name) VALUES ('Argentina');
INSERT INTO teams(name) VALUES ('Germany');
INSERT INTO teams(name) VALUES ('Netherlands');
INSERT INTO teams(name) VALUES ('Costa Rica');
INSERT INTO teams(name) VALUES ('Chile');
INSERT INTO teams(name) VALUES ('Nigeria');
INSERT INTO teams(name) VALUES ('Algeria');
INSERT INTO teams(name) VALUES ('Greece');
INSERT INTO teams(name) VALUES ('United States');

-- Insert data into games
INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Final', 1, 2, 4, 2);
INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Third Place', 3, 4, 2, 0);
-- (Rest of the 30 INSERT statements would follow similarly...)
