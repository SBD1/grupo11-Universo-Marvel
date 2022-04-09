from database import cursor

def update(table -> string, column -> string, value, condition -> string):
    """
    This function updates one row of a table.
    """
    query = "UPDATE {} SET {} = {} WHERE {}".format(table, column, value, condition)
    cursor.execute(query)
    return cursor.fetchone()
