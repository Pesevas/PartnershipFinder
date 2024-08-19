			--Nos posicionamos en la base creada
			USE NBA_BD;
			GO

			--Insertamos los datos desde el CSV para la tabla Game
			BULK INSERT Game
			    FROM 'C:\Users\franb\Downloads\PartnershipFinder_gitclone\PartnershipFinder\Data\PF_GameDataFinal.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
					 );

			--Insertamos los datos desde el CSV para la tabla  TeamDetails
			BULK INSERT TeamDetails
			    FROM 'C:\Users\franb\Downloads\PartnershipFinder_gitclone\PartnershipFinder\Data\PF_TeamDetailsDataFinal.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
					 );

				--Insertamos lo registros en la tabla OtherStats
			BULK INSERT OtherStats
			    FROM 'C:\Users\franb\Downloads\PartnershipFinder_gitclone\PartnershipFinder\Data\PF_OtherStatsDataFinal.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
				    );
			
		