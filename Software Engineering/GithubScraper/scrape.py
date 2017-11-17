from github import Github
import sqlite3 as sqlite
import plotly.plotly as plotly
import plotly.graph_objs as graph
import sys

g = Github("conalcosgrove", "Greenlion4603")


import datetime as dt

class User:
    id = 0
    name = ''
    num_of_commits = 0



d = dict()
count = 0

con = None

rep = g.get_organization('facebook').get_repo('react')

for commit in rep.get_commits():
    if count >= 100:
        break
    count = count + 1
    try:
        name = commit.author.name
        id = commit.author.id
        date = commit.commit.author.date.strftime("%d/%m/%y  %H:%M:%S")
        if name in d:
            d[commit.author.name].num_of_commits = d[commit.author.name].num_of_commits + 1
            print("{}: {} {} + 1".format(count,date,commit.author.name.encode('utf-8')))
        else:
            newUser = User()
            newUser.name = name.encode('utf-8')
            newUser.id = id
            newUser.num_of_commits = 1
            d[name] = newUser
            print("{}: {} New contributor: {}".format(count,date,commit.author.name.encode('utf-8')))

        # print("Name: " + commit.author.name + " Commit Id: " + commit.commit.message)
    except Exception as e:
        print(e)

try:
    con = sqlite.connect('db/data.db')
    cursor = con.cursor()

    for key in d.keys():
        try:

            name = d[key].name.encode('utf-8')
            if name is None:
                name = "skip"
            else:
                id = d[key].id
                commits = d[key].num_of_commits
                print('hello')
                string = "INSERT INTO COMMITTERS VALUES (" + str(id) + ",\"" + name.encode('utf-8') + "\"," + str(commits) + ");"
                print(string.encode('utf-8'))
                cursor.execute(string.encode('utf-8'))
        except sqlite.Error as e:
            print(e)

    cursor.execute('SELECT * FROM COMMITTERS;')
    rows = cursor.fetchall()
    for row in rows:
        print(row)

except sqlite.Error as e:
    print("Error : {}".format(e))
    sys.exit(1)

finally:
    if con:
        con.commit()
        con.close()
