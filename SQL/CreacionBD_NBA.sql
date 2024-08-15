CREATE DATABASE NBA;
GO
			
USE NBA;
GO

CREATE TABLE game (
    game_date DATE,
	season_id INT,
	team_id_home INT,
	team_abbreviation_home NVARCHAR(10),
	team_name_home NVARCHAR(100),
    game_id INT PRIMARY KEY,
    matchup_home NVARCHAR(50),
	wl_home NVARCHAR(5),
	minutos INT,
    fgm_home INT,
    fga_home INT,
    fg_pct_home DECIMAL(5, 4),
	fg3m_home INT,
	fg3a_home INT,
	fg3_pct_home DECIMAL(5, 4),
	ftm_home INT,
	fta_home INT,
	ft_pct_home DECIMAL(5, 4),
	oreb_home INT,
    dreb_home INT,
    reb_home INT,
    ast_home INT,
    stl_home INT,
    blk_home INT,
    tov_home INT,
    pf_home INT,
    pts_home INT,
    plus_minus_home INT,
	team_id_away INT,
    team_abbreviation_away NVARCHAR(10),
    team_name_away NVARCHAR(100),
    matchup_away NVARCHAR(50),
    wl_away NVARCHAR(5),
    fgm_away INT,
    fga_away INT,
    fg_pct_away DECIMAL(5, 4),
	fg3m_away INT,
	fg3a_away INT,
	fg3_pct_away DECIMAL(5, 4),
	ftm_away INT,
	fta_away INT,
	ft_pct_away DECIMAL(5, 4),
	oreb_away INT,
	dreb_away INT,
	reb_away INT,
	ast_away INT,
	stl_away INT,
	blk_away INT,
	tov_away INT,
	pf_away INT,
	pts_away INT,
	plus_minus_away INT,
	season_type NVARCHAR(50)
    );

-- Creación de la tabla "other_stats"
CREATE TABLE other_stats (
    stats_id INT PRIMARY KEY IDENTITY,
    game_id INT UNIQUE,
    team_id_home INT,
    team_abbreviation_home NVARCHAR(10),
    team_city_home NVARCHAR(50),
    pts_paint_home INT,
    pts_2nd_chance_home INT,
    pts_fb_home INT,
    largest_lead_home INT,
    lead_changes INT,
    times_tied INT,
    team_turnovers_home INT,
    total_turnovers_home INT,
    team_rebounds_home INT,
    pts_off_to_home INT,
    team_id_away INT,
    team_abbreviation_away NVARCHAR(10),
    team_city_away NVARCHAR(50),
    pts_paint_away INT,
    pts_2nd_chance_away INT,
    pts_fb_away INT,
    largest_lead_away INT,
    team_turnovers_away INT,
    total_turnovers_away INT,
    team_rebounds_away INT,
    pts_off_to_away INT
	);

-- Creación de la tabla "team_details"
CREATE TABLE team_details (
    team_id INT PRIMARY KEY,
    abbreviation NVARCHAR(10),
    nickname NVARCHAR(50),
    yearfounded INT,
    city NVARCHAR(50),
    arena NVARCHAR(100),
    arenacapacity INT,
    propietario NVARCHAR(100), 
    generalmanager NVARCHAR(100),
    headcoach NVARCHAR(100),
    dleagueaffiliation NVARCHAR(50),
    facebook NVARCHAR(100),
    instagram NVARCHAR(100),
    twitter NVARCHAR(100)
	);

-- Relaciones entre las tablas
ALTER TABLE game
    ADD CONSTRAINT Fk_game_teamdetails
	FOREIGN KEY (team_id_home) REFERENCES team_details(team_id),
    FOREIGN KEY (team_id_away) REFERENCES team_details(team_id);

ALTER TABLE other_stats
	ADD CONSTRAINT FK_otherstats_game_teamdetails
	FOREIGN KEY (game_id) REFERENCES game(game_id);




