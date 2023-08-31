DROP TABLE IF EXISTS 	matches;
DROP TABLE IF EXISTS 	teams;

CREATE TABLE teams (
	team 			VARCHAR(20)	NOT NULL,
	players_used 	INT			NOT NULL,
	avg_age 		FLOAT 		NOT NULL,
	possession 		FLOAT 		NOT NULL,
	games 			INT 		NOT NULL,
	goals 			INT 		NOT NULL,
	assists 		INT 		NOT NULL,
	cards_yellow 	INT 		NOT NULL,
	cards_red 		INT 		NOT NULL,
	CONSTRAINT pk_teams PRIMARY KEY (team)
);

COPY teams
FROM '/dataset/teams.csv'
CSV HEADER DELIMITER ';' ENCODING 'LATIN1';

CREATE TABLE matches (
	team1 		VARCHAR(20) 	NOT NULL,
	team2 		VARCHAR(20) 	NOT NULL,
	goals_team1	INT				NOT NULL,
	goals_team2	INT				NOT NULL,
	stage		VARCHAR(30)		NOT NULL,
	CONSTRAINT pk_matches PRIMARY KEY (team1, team2),
	CONSTRAINT fk_team1 FOREIGN KEY (team1) REFERENCES teams ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_team2 FOREIGN KEY (team2) REFERENCES teams ON UPDATE CASCADE ON DELETE CASCADE
);

COPY matches
FROM '/dataset/matches.csv'
CSV HEADER DELIMITER ';' ENCODING 'LATIN1';





