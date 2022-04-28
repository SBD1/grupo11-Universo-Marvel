from database import cursor

def update(table, column, value, condition):
    """
    This function updates one row of a table.
    """
    query = "UPDATE {} SET {} = {} WHERE {}".format(table, column, value, condition)
    cursor.execute(query)
    return cursor.fetchone()
