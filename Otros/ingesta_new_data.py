import pandas as pd
import pyodbc
import os
import logging

# Configuración del archivo de log
log_file = r'C:\Users\franb\Downloads\PartnershipFinder_gitclone\PartnershipFinder\Otros\update_log.txt'
logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def log_update(message):
    logging.info(message)

def get_existing_records(table_name, connection, columns):
    cursor = connection.cursor()
    query = f"SELECT {', '.join(columns)} FROM {table_name}"
    cursor.execute(query)
    records = {tuple(row) for row in cursor.fetchall()}
    return records

def load_data_to_sql(file_path, table_name, connection, unique_columns):
    df = pd.read_csv(file_path)
    
    # Renombrar columnas en el DataFrame si es necesario
    if 'owner' in df.columns:
        df.rename(columns={'owner': 'propietario'}, inplace=True)
    if 'min' in df.columns:
        df.rename(columns={'min': 'minutos'}, inplace=True)

    existing_records = get_existing_records(table_name, connection, unique_columns)
    
    new_data = []
    
    for _, row in df.iterrows():
        record = tuple(row[unique_columns])
        if record not in existing_records:
            new_data.append(row)
    
    if new_data:
        df_new = pd.DataFrame(new_data)
        # Cargar los datos nuevos en la base de datos
        try:
            with connection.cursor() as cursor:
                for _, row in df_new.iterrows():
                    columns = ', '.join(df_new.columns)
                    placeholders = ', '.join('?' * len(row))
                    insert_sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
                    cursor.execute(insert_sql, tuple(row))
            connection.commit()
            new_records_count = len(new_data)
            log_update(f'Cantidad de registros nuevos añadidos a {table_name}: {new_records_count}.')
        except Exception as e:
            log_update(f'Error al insertar datos en {table_name}: {str(e)}')
    else:
        log_update(f'No se encontraron nuevos registros para {file_path} en la tabla {table_name}.')
    
    return len(new_data)

def main():
    server = 'FRAN'
    data_folder = r'C:\Users\franb\Downloads\PartnershipFinder_gitclone\PartnershipFinder\Data'
    files_and_tables = {
        'PF_GameDataFinal.csv': ('dbo.Game', ['game_id']),
        'PF_OtherStatsDataFinal.csv': ('dbo.OtherStats', ['game_id', 'team_id_home', 'team_id_away']),
        'PF_TeamDetailsDataFinal.csv': ('dbo.TeamDetails', ['team_id'])
    }

    conn_str = f'DRIVER={{SQL Server}};SERVER={server};DATABASE=NBA_BD;Trusted_Connection=yes;'
    with pyodbc.connect(conn_str) as conn:
        for file_name, (table_name, unique_columns) in files_and_tables.items():
            file_path = os.path.join(data_folder, file_name)
            try:
                added_records = load_data_to_sql(file_path, table_name, conn, unique_columns)
                if added_records == 0:
                    log_update(f'No se encontraron nuevos registros para {file_name} en la tabla {table_name}.')
            except Exception as e:
                log_update(f'Error procesando {file_name} en la tabla {table_name}: {str(e)}')

if __name__ == "__main__":
    main()
