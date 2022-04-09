import psycopg2

#Configurações
host = "localhost"
dbname = "db_marvel"
user = "postgres"
password = "postgres"
sslmode = "require"

#String de conexão
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Conectado")

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