--TABLES
--Replace this with your table creations.
CREATE TABLE Team (
team_id DECIMAL(12) PRIMARY KEY NOT NULL,
team_name VARCHAR(64) NOT NULL,
season_wins DECIMAL(2) NOT NULL,
season_losses DECIMAL(2) NOT NULL,
season_ties DECIMAL(2) NOT NULL
);

CREATE TABLE Coach (
coach_id DECIMAL(12) PRIMARY KEY NOT NULL,
team_id DECIMAL(12) NOT NULL,
coach_first_name VARCHAR(128) NOT NULL,
coach_last_name VARCHAR(128) NOT NULL,
coach_type VARCHAR(128) NOT NULL,
FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Player (
player_id DECIMAL (12) PRIMARY KEY NOT NULL,
team_id DECIMAL(12) NOT NULL,
position_type VARCHAR(4) NOT NULL,
player_first_name VARCHAR(128) NOT NULL,
player_last_name VARCHAR(128) NOT NULL,
date_of_birth DATE NOT NULL,
games_played DECIMAL(3),
rookie VARCHAR(3) NOT NULL,
FOREIGN KEY (team_id) REFERENCES Team(team_id),
);

CREATE TABLE TE (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
passing_yards DECIMAL(4),
passing_yards_per_game DECIMAL(4),
catches DECIMAL(3),
catches_per_game DECIMAL(3),
passing_td DECIMAL(2),
fumbles DECIMAL (3)
);

CREATE TABLE WR (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
passing_yards DECIMAL(4),
passing_yards_per_game DECIMAL(4),
catches DECIMAL(3),
catches_per_game DECIMAL(3),
passing_td DECIMAL(2),
fumbles DECIMAL (3)
);

CREATE TABLE RB (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
rushing_yards DECIMAL(4),
rushing_yards_per_game DECIMAL(4),
passing_yards DECIMAL(4),
passing_yards_per_game DECIMAL(4),
catches DECIMAL(3),
catches_per_game DECIMAL(3),
passing_td DECIMAL(2),
rushing_td DECIMAL(2),
fumbles DECIMAL (3)
);

CREATE TABLE QB (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
rushing_yards DECIMAL(4),
rushing_yards_per_game DECIMAL(4),
passing_yards DECIMAL(4),
passing_yards_per_game DECIMAL(4),
passing_td DECIMAL(2),
rushing_td DECIMAL(2),
fumbles DECIMAL (3),
interceptions DECIMAL(3)
);

CREATE TABLE K (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
fg_made DECIMAL(3),
fg_missed DECIMAL(3),
fg_percentage DECIMAL(4,2)
);

CREATE TABLE D_ST (
player_id DECIMAL(12) PRIMARY KEY NOT NULL,
fantasy_pts DECIMAL(5,2),
fantasy_pts_per_game DECIMAL(5,2),
sacks DECIMAL(3),
sacks_per_game DECIMAL(3),
fumbles DECIMAL (3),
interceptions DECIMAL(3),
td DECIMAL(3),
td_per_game DECIMAL(3),
rushing_yards_allowed DECIMAL(4),
passing_yards_allowed DECIMAL(4)
);

-- Order in which to drop the tables
DROP TABLE Coach
DROP TABLE Team
DROP TABLE Player
DROP TABLE QB
DROP TABLE WR
DROP TABLE TE
DROP TABLE RB
DROP TABLE K
DROP TABLE D_ST

--SEQUENCES
-- Here are the sequences that I will use for the tables primary keys and trigger and history tables!

CREATE SEQUENCE player_id_seq START WITH 1;
CREATE SEQUENCE team_id_seq START WITH 1;
CREATE SEQUENCE coach_id_seq START WITH 1;

-- Here are the drop sequences in the order I created them in
DROP SEQUENCE player_id_seq;
DROP SEQUENCE team_id_seq;
DROP SEQUENCE coach_id_seq;

-- Adding the data for Coaches

-- Start the Declare, need to highlight all of the inserts for this table for it to work
DECLARE @current_team_id_seq INT = 1

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Tampa Bay Buccanears',11,5,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Kansas City Chiefs',14,2,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Denver Broncos',5,11,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Las vegas Raiders',8,8,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Tennessee Titans',11,5,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Indianapolis Colts',11,5,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Houstan Texans',4,12,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Jacksonville Jaguars',1,15,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'New Orleans Saints',12,4,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Carolina Panthers',5,11,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Atlanta Falcons',4,12,0);

SET  @current_team_id_seq = NEXT VALUE FOR team_id_seq;
INSERT INTO Team 
VALUES(@current_team_id_seq,'Los Angeles Chargers',7,9,0);

SELECT * FROM Team

-- Adding the data for Coach

-- Start the Declare, need to highlight all of the inserts for this table for it to work
DECLARE @current_coach_id_seq INT = 1

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,1,'Bruce','Arians','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,2,'Ed','Reid','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,3,'Vic','Fangio','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,4,'Jon','Gruden','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,5,'Mike','Vrabel','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,6,'Frank','Reich','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,7,'David','Culley','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,8,'Urban','Meyer','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,9,'Sean','Payton','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,10,'Matt','Rhule','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,11,'Arthur','Smith','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,12,'Brandon','Staley','Head Coach')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,3,'Pat','Shurmer','Offensive Coordinator')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,3,'Ed','Donatell','Defensive Coordinator')

SET  @current_coach_id_seq = NEXT VALUE FOR coach_id_seq;
INSERT INTO Coach
VALUES(@current_coach_id_seq,3,'Tom','McMahon','Special Teams Coordinator')

SELECT * FROM Coach

 -- Date for Players

 -- Start the Declare, need to highlight all of the inserts for this table for it to work
 DECLARE @current_player_id_seq INT = 1

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,1,'QB','Tom','Brady','03-AUG-1977',16,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,1,'RB','Leonard','Fournette','18-JAN-1995',13,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,2,'QB','Patrick','Mahomes','17-SEP-1995',15,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,3,'WR','Jerry','Jeudy','24-APR-1999',16,'YES');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,12,'K','Michael','Badgley','28-JUL-1995',16,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,10,'RB','Mike','Davis','19-FEB-1993',15,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,4,'TE','Darren','Waller','13-SEP-1992',16,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,6,'D/ST','Indianapolis','Colts','01-JAN-1953',16,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,9,'RB','Alvin','Kamara','25-JUL-1995',15,'NO');

SET  @current_player_id_seq = NEXT VALUE FOR player_id_seq;
INSERT INTO Player 
VALUES(@current_player_id_seq,11,'WR','Julio','Jones','03-FEB-1989',9,'NO');

SELECT * FROM Player

-- Insert Stats for each player based on HALF PPR stats found on fantasydata.com

/*QB's*/

INSERT INTO QB(player_id,fantasy_pts,fantasy_pts_per_game,rushing_yards,rushing_yards_per_game,passing_yards,passing_yards_per_game,passing_td,rushing_td,fumbles,interceptions)
VALUES(3,374.40,25,308,21,4740,316,38,2,3,6)
INSERT INTO QB(player_id,fantasy_pts,fantasy_pts_per_game,rushing_yards,rushing_yards_per_game,passing_yards,passing_yards_per_game,passing_td,rushing_td,fumbles,interceptions)
VALUES(1,337.92,21.1,6,0,4633,290,40,3,1,12)

/*RB's*/

INSERT INTO RB(player_id,fantasy_pts,fantasy_pts_per_game,rushing_yards,rushing_yards_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,rushing_td,fumbles)
VALUES(2,96,7.4,367,28,233,18,36,2.8,0,6,0)
INSERT INTO RB(player_id,fantasy_pts,fantasy_pts_per_game,rushing_yards,rushing_yards_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,rushing_td,fumbles)
VALUES(9,294.8,19.7,932,62,756,50,83,6,5,16,1)
INSERT INTO RB(player_id,fantasy_pts,fantasy_pts_per_game,rushing_yards,rushing_yards_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,rushing_td,fumbles)
VALUES(6,147.5,9.8,642,43,373,25,59,4,2,6,1)

/*K*/

INSERT INTO K(player_id,fantasy_pts,fantasy_pts_per_game,fg_made,fg_missed,fg_percentage)
VALUES(5,112,7,24,33,72.7)

/*WR*/

INSERT INTO WR(player_id,fantasy_pts,fantasy_pts_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,fumbles)
VALUES(4,105.6,6.6,856,54,52,3,3,2)
INSERT INTO WR(player_id,fantasy_pts,fantasy_pts_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,fumbles)
VALUES(10,95.1,10.6,771,86,51,6,0,0)

/*D/ST*/

INSERT INTO D_ST(player_id,fantasy_pts,fantasy_pts_per_game,sacks,sacks_per_game,fumbles,interceptions,td,td_per_game,rushing_yards_allowed,passing_yards_allowed)
VALUES(8,151,9.4,40,3,11,0,0,0,1448,3866)

/*TE*/

INSERT INTO TE(player_id,fantasy_pts,fantasy_pts_per_game,passing_yards,passing_yards_per_game,catches,catches_per_game,passing_td,fumbles)
VALUES(7,171.6,10.7,1196,75,107,7,9,0)


--INDEXES
-- Index which finds players from a certain team
SELECT *
FROM Player
JOIN Team ON Team.team_id = Player.team_id
WHERE Team.team_id = 1

CREATE UNIQUE INDEX team_name_index
ON Team(team_name);

CREATE INDEX player_first_name_index
ON Player(player_first_name)

CREATE INDEX player_last_name_index
ON Player(player_last_name)

-- Index to find 
-- Index which finds best performing QBs
SELECT Player.player_id, Player.player_first_name, Player.player_last_name, 
		QB.fantasy_pts,QB.passing_td, QB.rushing_td, QB.passing_yards
FROM Player
JOIN QB ON QB.player_id = Player.player_id
WHERE QB.passing_yards > 4000 AND (passing_td + rushing_td) > 30

--HISTORY TRIGGER

CREATE TABLE player_change_team_histoy (
player_id DECIMAL(12) NOT NULL,
old_team_id DECIMAL(12) NOT NULL,
new_team_id DECIMAL(12) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (player_id) REFERENCES Player(player_id));

-- Create Trigger to change Team

CREATE TRIGGER player_change_team_trg 
ON Player AFTER UPDATE
AS
BEGIN
	DECLARE @old_team_id VARCHAR(64) = (SELECT team_id FROM DELETED);
	DECLARE @new_team_id VARCHAR(64) = (SELECT team_id FROM INSERTED);
	DECLARE @player_id DECIMAL(12) = (SELECT player_id FROM INSERTED);

	IF @old_team_id <> @new_team_id
	BEGIN
		INSERT INTO player_change_team_histoy(player_id,old_team_id,new_team_id,ChangeDate)
		VALUES(@player_id,@old_team_id,@new_team_id, GETDATE());
	END;
END;

-- This test will be for Mike Davis
-- Mike Davis joined the Carolina Panthers during the off-season.


UPDATE Player
SET team_id = 11
WHERE player_first_name = 'Mike' AND player_last_name = 'Davis'

SELECT * FROM player_change_team_histoy

SELECT * FROM Player
JOIN Team ON Team.team_id = Player.team_id
WHERE player_first_name = 'Mike' AND player_last_name = 'Davis'

--STORED PROCEDURES
--Replace this with your stored procedure definitions.

-- USE Case is adding a Rookie into the database that has just been selected for a team.
-- Trevor Lawrence most likely will be drafted by the Jacksonville Jaguars, in this case he has been selected and I am now adding him to the table

CREATE PROCEDURE Add_Rookie @player_id DECIMAL(12), @team_id DECIMAL(12), @position_type VARCHAR(4),
							@player_first_name VARCHAR(128), @player_last_name VARCHAR(128), @date_of_birth DATE
AS
BEGIN
	INSERT INTO Player(player_id,team_id,position_type,player_first_name,player_last_name,date_of_birth,games_played,rookie)
	VALUES (@player_id, @team_id, @position_type,@player_first_name, @player_last_name, @date_of_birth, 0, 'YES');
END;

BEGIN TRANSACTION Add_Rookie;
EXECUTE Add_Rookie 11,8,'QB','Trevor','Lawrence', '06-OCT-1999';
COMMIT TRANSACTION Add_Rookie

-- See if Trevor was added in the player database
SELECT * FROM Player

-- New procedure to update rookie status for older players

CREATE PROCEDURE Update_Rookie_Status @player_id DECIMAL(12)
AS
BEGIN
	UPDATE Player
	SET rookie = 'NO'
	WHERE player_id = @player_id
END;

BEGIN TRANSACTION Update_Rookie_Status;
EXECUTE Update_Rookie_Status 4;
COMMIT TRANSACTION Update_Rookie_Status

DROP PROCEDURE Update_Rookie_Status

-- New procedure to update player's team_id if they are traded or cut/resign to new team.

CREATE PROCEDURE Update_team_Status @player_id DECIMAL(12), @team_id DECIMAL(12)
AS
BEGIN
	UPDATE Player
	SET team_id = @team_id 
	WHERE player_id = @player_id
END;

BEGIN TRANSACTION Update_team_Status;
EXECUTE Update_team_Status 6,10;
COMMIT TRANSACTION Update_team_Status

SELECT * FROM Team

DROP PROCEDURE Update_team_Status

--QUERIES
--Replace this with your queries.

-- Strong Fantasy Performing QB Query
SELECT * 
FROM Player
JOIN QB ON QB.player_id = Player.player_id
WHERE fantasy_pts > 200
ORDER BY fantasy_pts

-- Strong Fantasy Performing RB Query
SELECT * 
FROM Player
JOIN RB ON RB.player_id = Player.player_id
WHERE fantasy_pts > 150
ORDER BY fantasy_pts

-- Strong Fantasy Performing WR Query
SELECT * 
FROM Player
JOIN WR ON WR.player_id = Player.player_id
WHERE fantasy_pts > 100
ORDER BY fantasy_pts

-- Strong Fantasy Performing TE Query
SELECT * 
FROM Player
JOIN TE ON TE.player_id = Player.player_id
WHERE fantasy_pts > 100
ORDER BY fantasy_pts

-- Strong Fantasy Performing K Query
SELECT * 
FROM Player
JOIN K ON K.player_id = Player.player_id
WHERE fantasy_pts > 100
ORDER BY fantasy_pts

-- Strong Fantasy Performing D_ST Query
SELECT * 
FROM Player
JOIN D_ST ON D_ST.player_id = Player.player_id
WHERE fantasy_pts > 100
ORDER BY fantasy_pts

-- Best Teams based on performance who also had a great QB and the QB did not miss any games
SELECT team_name,season_wins,player_first_name,player_last_name,position_type,fantasy_pts,games_played FROM Team
JOIN Player ON Player.team_id = Team.team_id
JOIN QB ON QB.player_id = Player.player_id
WHERE season_wins > 10 AND position_type = 'QB' AND games_played = 16 AND fantasy_pts > 200

-- Which players did not miss more than 2 games

SELECT player_first_name, player_last_name, games_played
FROM Player
WHERE games_played > 13
GROUP BY games_played, player_first_name, player_last_name

-- Data Visualization
-- I want to analyze the number of players who managed to play a whole season without missing any games (bar chart)
SELECT player_first_name, player_last_name, games_played,
		(coalesce(QB.fantasy_pts,0) + coalesce(RB.fantasy_pts,0)  + coalesce(WR.fantasy_pts,0) + coalesce(TE.fantasy_pts,0) + coalesce(D_ST.fantasy_pts,0) + coalesce(K.fantasy_pts,0)) AS Fantasy_pts
FROM Player
JOIN Team ON Team.team_id = Player.team_id
FULL JOIN QB ON QB.player_id = Player.player_id
FULL JOIN RB ON RB.player_id = Player.player_id
FULL JOIN WR ON WR.player_id = Player.player_id
FULL JOIN TE ON TE.player_id = Player.player_id
FULL JOIN D_ST ON D_ST.player_id = Player.player_id
FULL JOIN K ON K.player_id = Player.player_id
GROUP BY games_played, player_first_name, player_last_name,
		QB.fantasy_pts, RB.fantasy_pts, WR.fantasy_pts, TE.fantasy_pts, D_ST.fantasy_pts, K.fantasy_pts

-- Find the best players overall player based on Fantasy Pts. (Scatter Plot)

SELECT Player.player_id, player_first_name, Player.player_last_name,team_name,
		(coalesce(QB.fantasy_pts,0) + coalesce(RB.fantasy_pts,0)  + coalesce(WR.fantasy_pts,0) + coalesce(TE.fantasy_pts,0) + coalesce(D_ST.fantasy_pts,0) + coalesce(K.fantasy_pts,0)) AS Fantasy_pts,
		(coalesce(QB.fantasy_pts_per_game,0) + coalesce(RB.fantasy_pts_per_game,0)  + coalesce(WR.fantasy_pts_per_game,0) + coalesce(TE.fantasy_pts_per_game,0) + coalesce(D_ST.fantasy_pts_per_game,0)
		+ coalesce(K.fantasy_pts_per_game,0)) AS Fantasy_pts_per_game

FROM Player
JOIN Team ON Team.team_id = Player.team_id
FULL JOIN QB ON QB.player_id = Player.player_id
FULL JOIN RB ON RB.player_id = Player.player_id
FULL JOIN WR ON WR.player_id = Player.player_id
FULL JOIN TE ON TE.player_id = Player.player_id
FULL JOIN D_ST ON D_ST.player_id = Player.player_id
FULL JOIN K ON K.player_id = Player.player_id
GROUP BY Player.player_id, player_first_name, Player.player_last_name,team_name, QB.fantasy_pts, RB.fantasy_pts, WR.fantasy_pts, TE.fantasy_pts, D_ST.fantasy_pts, K.fantasy_pts,
			QB.fantasy_pts_per_game, RB.fantasy_pts_per_game, WR.fantasy_pts_per_game, TE.fantasy_pts_per_game, D_ST.fantasy_pts_per_game, K.fantasy_pts_per_game





-- I want to analyze the number of players who managed to play a whole season without missing any games (bar chart)
SELECT team_name, season_wins
FROM Team
ORDER BY season_wins

