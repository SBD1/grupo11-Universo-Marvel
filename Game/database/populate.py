from connection import cursor, connection
from sql import tuplas 
from os import path

paths = tuplas.paths
# read file of sql commands
for i in range(len(paths)):
    dml_table_script = open(path.dirname(path.abspath(__file__)) + paths[i], "r").read()
    # execute each sql command in the file
    cursor.execute(dml_table_script)

# close connection with database    
connection.commit()
connection.close()
