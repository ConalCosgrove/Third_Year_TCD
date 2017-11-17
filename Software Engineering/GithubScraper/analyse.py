import sqlite3 as db

con = None

try:
    con = db.connect('db/data.db')
    cursor = con.cursor()
    count = 0
    while count < 24:
        cursor.execute('SELECT * FROM COMMITS WHERE TIME_HOUR = ' + str(count) + ";")
        entries = cursor.fetchall()
        print("Commits made at hour {}: {}".format(count,entries.__sizeof__()))
        count = count + 1
except Exception as e:
    print(e)
