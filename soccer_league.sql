-- from the terminal run:
-- psql < soccer_league.sql
DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\ c soccer_league CREATE TABLE teams (
    id INT PRIMARY KEY NOT NULL,
    team_city TEXT NOT NULL,
    team_name TEXT NOT NULL,
    wins INT NOT NULL,
    losses INT NOT NULL,
    ties INT NOT NULL,
    points INT NOT NULL,
    goals_for INT NOT NULL,
    goals_against INT NOT NULL
);

CREATE TABLE players (
    id INT PRIMARY KEY NOT NULL,
    first_name TEXT,
    last_name TEXT NOT NULL,
    position TEXT NOT NULL,
    team_id INT NOT NULL REFERENCES teams (id)
);

CREATE TABLE goals (
    id INT PRIMARY KEY NOT NULL,
    game_id INT NOT NULL REFERENCES games (id),
    player_id INT NOT NULL REFERENCES players (id),
    goal_time TIME NOT NULL
);

CREATE TABLE referees (
    id INT PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE games (
    id INT PRIMARY KEY NOT NULL,
    game_date DATE NOT NULL,
    home_team TEXT NOT NULL REFERENCES teams (team_name),
    home_team_score INT NOT NULL,
    home_team_result TEXT NOT NULL,
    road_team TEXT NOT NULL REFERENCES teams (team_name),
    road_team_score INT NOT NULL,
    road_team_result TEXT NOT NULL,
    ref_id INT NOT NULL REFERENCES referees (id)
);

CREATE TABLE standings (
    team_id INT NOT NULL REFERENCES (id),
    team_name TEXT NOT NULL REFERENCES teams (team_name),
    wins INT NOT NULL REFERENCES teams (wins),
    losses INT NOT NULL REFERENCES teams (losses),
    ties INT NOT NULL REFERENCES teams (ties),
    points INT NOT NULL REFERENCES teams (points),
    goals_for INT NOT NULL REFERENCES teams (goals_for),
    goals_against INT NOT NULL REFERENCES teams (goals_against),
    goal_diff INT NOT NULL
);