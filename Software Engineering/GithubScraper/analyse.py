import sqlite3 as db


con = None
total_commits = 0
try:
    output_file = open('db/time_vs_commits.tsv','w')
    output_file.write("letter\tfrequency\n")
    con = db.connect('db/data.db')
    cursor = con.cursor()
    count = 0
    while count < 24:

        cursor.execute('SELECT * FROM COMMITS WHERE TIME_HOUR = ' + str(count) + ";")
        entries = cursor.fetchall()
        print("Commits made at hour {}: {}".format(count,entries.__sizeof__()))
        total_commits = total_commits + entries.__sizeof__()
        #print(count)
        c = 0
        count = count + 1

    print(total_commits)
    count = 0

    while count < 24:
        cursor.execute('SELECT * FROM COMMITS WHERE TIME_HOUR = ' + str(count) + ";")
        entries = cursor.fetchall()
        frequency = float(entries.__sizeof__())/float(total_commits)
        output_file.write("{}\t{}\n".format(count,entries.__sizeof__()))
        count = count + 1

except Exception as e:
    print(e)
finally:
    con.close()
