from database import cursor

def select_one(table -> string, column -> string, condition -> string):
    """
    This function returns the first row of a table that matches the condition.
    """
    query = "SELECT {} FROM {} WHERE {}".format(column, table, condition)
    cursor.execute(query)
    return cursor.fetchone()

def select_all(table -> string, column -> string, condition -> string):
    """
    This function returns all rows of a table that matches the condition.
    """
    query = "SELECT {} FROM {} WHERE {}".format(column, table, condition)
    cursor.execute(query)
    return cursor.fetchall()