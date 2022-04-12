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
    #String de conexão
    conn = psycopg2.connect(
        host=db_host,
        database=postgres_db,
        user=postgres_user,
        port=db_port,
        password=postgres_password)
    print("Connection successfully")
    # print(open("tabelas.sql", "r").read())
    # with self.connection as cursor:
    #     cursor.execute(open("tabelas.sql", "r").read())
except: 
    print("Something went wrong")


cursor = conn.cursor()

#----Exemplos----#

#Criar Tabela
#cursor.execute("CREATE TABLE inventory (id serial PRIMARY KEY, name VARCHAR(50), quantity INTEGER);")
#print("Criação de tabela finalizada")


#Adicionar dados
#cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("banana", 150))
#cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("orange", 154))
#cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("apple", 100))
#print("Adicionadas 3 linhas de dados")

#commitando e finalizando a conexão
#conn.commit()
#cursor.close()
#conn.close()
