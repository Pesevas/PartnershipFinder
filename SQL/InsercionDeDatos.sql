			--Nos posicionamos en la base creada
			USE NBA_BD;
			GO

			--Insertamos los datos desde el CSV para la tabla Game
			BULK INSERT Game
			    FROM 'D:\Pedro\Carrera Data Analytics\Labs\FinalProject\Dataset\Final\PF_GameDataFinal.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
					 );

			--Insertamos los datos desde el CSV para la tabla  TeamDetails
			BULK INSERT TeamDetails
			    FROM 'D:\Pedro\Carrera Data Analytics\Labs\FinalProject\Dataset\Final\archivo_data_details_Final.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
					 );

				--Insertamos lo registros en la tabla OtherStats
			BULK INSERT OtherStats
			    FROM 'D:\Pedro\Carrera Data Analytics\Labs\FinalProject\Dataset\Final\Data_stats_Final_Filtrado2.csv'
			    WITH (
			        FIRSTROW = 2,
			        FIELDTERMINATOR = ',',
			        ROWTERMINATOR = '\n',
					KEEPNULLS
				    );
			
			