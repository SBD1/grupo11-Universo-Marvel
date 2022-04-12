import psycopg2 
from decouple import config

#Configurações
db_dialect=config('DB_DIALECT')
db_host=config('DB_HOST')
db_port=config('DB_PORT')
postgres_user=config('POSTGRES_USER')
postgres_password=config('POSTGRES_PASSWORD')
postgres_db=config('POSTGRES_DB')

try :
    connection = psycopg2.connect(
        host=db_host,
        database=postgres_db,
        user=postgres_user,
        port=db_port,
        password=postgres_password)

    connection.autocommit = True
    cursor = connection.cursor()
    print("Connection established")
except (Exception, psycopg2.DatabaseError) as error:
    print(error)
