			-- Creamos la base de datos
			CREATE DATABASE NBA_BD;
			GO
			
			--Nos posicionamos en la base creada
			USE NBA_BD;
			GO
			
			--Creamos la tabla de hechos Game
			--Se cambió el nombre del campo min por minutos, ya que min es un palabra reservada por SQL
			CREATE TABLE Game (
				game_date DATE,
				season_id INT,
				team_id_home INT,
				team_abbreviation_home NVARCHAR(10),
				team_name_home NVARCHAR(100),
				game_id INT PRIMARY KEY,
				matchup_home NVARCHAR(50),
				wl_home NVARCHAR(5),
				minutos INT,
				fgm_home FLOAT,
				fga_home FLOAT,
				fg_pct_home FLOAT,
				fg3m_home FLOAT,
				fg3a_home FLOAT,
				fg3_pct_home FLOAT,
				ftm_home FLOAT,
				fta_home FLOAT,
				ft_pct_home FLOAT,
				oreb_home FLOAT,
				dreb_home FLOAT,
				reb_home FLOAT,
				ast_home FLOAT,
				stl_home FLOAT,
				blk_home FLOAT,
				tov_home FLOAT,
				pf_home FLOAT,
				pts_home FLOAT,
				plus_minus_home INT,
				team_id_away INT,
				team_abbreviation_away NVARCHAR(10),
				team_name_away NVARCHAR(100),
				matchup_away NVARCHAR(50),
				wl_away NVARCHAR(5),
				fgm_away FLOAT,
				fga_away FLOAT,
				fg_pct_away FLOAT,
				fg3m_away FLOAT,
				fg3a_away FLOAT,
				fg3_pct_away FLOAT,
				ftm_away FLOAT,
				fta_away FLOAT,
				ft_pct_away FLOAT,
				oreb_away FLOAT,
				dreb_away FLOAT,
				reb_away FLOAT,
				ast_away FLOAT,
				stl_away FLOAT,
				blk_away FLOAT,
				tov_away FLOAT,
				pf_away FLOAT,
				pts_away FLOAT,
				plus_minus_away INT,
				season_type NVARCHAR(50)
			    );
			GO
						
			--Creamos la tabla TeamDetails
			--Se cambió el nombre del campo owner por propietario, ya que owner es un palabra reservada por SQL
			CREATE TABLE TeamDetails (
			    team_id INT PRIMARY KEY,
			    abbreviation NVARCHAR(10),
			    nickname NVARCHAR(50),
			    yearfounded FLOAT,
			    city NVARCHAR(50),
			    arena NVARCHAR(100),
			    arenacapacity FLOAT,
			    propietario NVARCHAR(100), 
			    generalmanager NVARCHAR(100),
			    headcoach NVARCHAR(100),
			    dleagueaffiliation NVARCHAR(50)
			  );
			
			--Creamos la tabla OtherStats
			CREATE TABLE OtherStats (
			    game_id INT,
			    team_id_home INT,
			    team_abbreviation_home NVARCHAR(10),
			    team_city_home NVARCHAR(50),
			    pts_paint_home INT,
			    pts_2nd_chance_home INT,
			    pts_fb_home INT,
			    largest_lead_home INT,
			    lead_changes INT,
			    times_tied INT,
			    team_turnovers_home FLOAT,
			    total_turnovers_home FLOAT,
			    team_rebounds_home FLOAT,
			    pts_off_to_home FLOAT,
			    team_id_away INT,
			    team_abbreviation_away NVARCHAR(10),
			    team_city_away NVARCHAR(50),
			    pts_paint_away INT,
			    pts_2nd_chance_away INT,
			    pts_fb_away INT,
			    largest_lead_away INT,
			    team_turnovers_away FLOAT,
			    total_turnovers_away FLOAT,
			    team_rebounds_away FLOAT,
			    pts_off_to_away FLOAT
				);
				
			--Creamos las claves foráneas
			ALTER TABLE Game
			    ADD CONSTRAINT Fk_Game_TeamDetails
			    FOREIGN KEY (team_id_home) REFERENCES TeamDetails(team_id),
			    FOREIGN KEY (team_id_away) REFERENCES TeamDetails(team_id);
			
			ALTER TABLE OtherStats
			    ADD CONSTRAINT FK_Otherstats_Game
			    FOREIGN KEY (game_id) REFERENCES Game(game_id);

			