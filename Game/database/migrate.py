from connection import cursor, connection
from os import path

# read file of sql commands
dml_table_script = open(path.dirname(path.abspath(__file__)) + "/sql/tabelas.sql", "r").read()
  
# execute each sql command in the file
cursor.execute(dml_table_script)
    
# close connection with database    
connection.commit()
connection.close()