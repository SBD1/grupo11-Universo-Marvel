from database.connection import cursor

def select_one(table, column, condition = ''):
    """
    This function returns the first row of a table that matches the condition.
    """
    query = "SELECT {} FROM {}".format(column, table)
    if condition != '':
        query += "WHERE {}".format(condition)
    cursor.execute(query)
    return cursor.fetchone()

def select_all(table, column, condition = ''):
    """
    This function returns all rows of a table that matches the condition.
    """
    query = "SELECT {} FROM {}".format(column, table)
    if condition != '':
        query += "WHERE {}".format(condition)
    cursor.execute(query)
    return cursor.fetchall()