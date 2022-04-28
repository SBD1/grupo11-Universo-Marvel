from database import cursor

def insert(table, column, value):
    """
    This function inserts one row into a table.
    """
    query = "INSERT INTO {} ({}) VALUES ({});".format(table, column, value)
    cursor.execute(query)
    return cursor.fetchone()

