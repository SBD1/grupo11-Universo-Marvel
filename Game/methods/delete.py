from database import cursor

def delete(table -> string, condition -> string):
    """
    This function deletes one row of a table.
    """
    query = "DELETE FROM {} WHERE {}".format(table, condition)
    cursor.execute(query)
    return cursor.fetchone()
