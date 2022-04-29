import psycopg2

#Configurações
host = "localhost"
dbname = "sbd_marvel"
user = "postgres"
password = "postgres"
sslmode = "require"

#String de conexão
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)

cursor = conn.cursor()