import sqlite3 as sqlite

con = None              #set up null connection to database

try:
    con = sqlite.connect('db/data.db')
    cursor = con.cursor()

    create_table_start = "CREATE TABLE" + " "
    table_name = "COMMITS" + " ("
    id_field = "ID TEXT PRIMARY KEY NOT NULL" + ", "
    hour_field = "TIME_HOUR INT NOT NULL" + ", "
    minute_field = "TIME_MINUTE INT NOT NULL" + ", "
    second_field = "TIME_SECOND INT NOT NULL" + " "
    end_of_query = ");"

    final_query = create_table_start + table_name + id_field + hour_field + minute_field + second_field + end_of_query
    cursor.execute(final_query)
    print('Table Created!')
except Exception as e:
    print(e.message)

