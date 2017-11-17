from github import Github
import sqlite3 as sqlite
import sys

g = Github("conalcosgrove", "Greenlion4603")


import datetime as dt

class Node:
    id = ""
    hour = 0
    minute = 0
    second = 0
    nextNode = None


class LinkedList:
    head = None
    def addNode(self,n):
        if self.head is None:
            self.head = n
        else:
            n.nextNode = self.head
            self.head = n

d = dict()
count = 0

con = None

rep = g.get_organization('facebook').get_repo('react')
commitLog = LinkedList()
for commit in rep.get_commits():
    if count >= 5000:
        break
    count = count + 1
    try:
        id = commit.sha
        time_hour = commit.commit.author.date.hour
        time_minute = commit.commit.author.date.minute
        time_second = commit.commit.author.date.second
        nnode = Node()

        nnode.id = id
        nnode.hour = time_hour
        nnode.minute = time_minute
        nnode.second = time_second

        commitLog.addNode(nnode)
        #print(str(time_hour) + ":" + str(time_minute) + ":" + str(time_second))


        # print("Name: " + commit.author.name + " Commit Id: " + commit.commit.message)
    except Exception as e:
        print(e)

printNode = commitLog.head
count = 0

'''while printNode is not None:
    print("{} {} {}:{}:{}".format(count,printNode.id,printNode.hour,printNode.minute,printNode.second))
    printNode = printNode.nextNode
    count = count + 1
'''

try:
    con = sqlite.connect('db/data.db')
    cursor = con.cursor()

    printNode = commitLog.head
    count = 0

    while printNode is not None:
        string = "INSERT INTO COMMITS VALUES (\"" + str(printNode.id) + "\"," + str(printNode.hour) + "," + str(printNode.minute) + "," + str(printNode.second) + ");"
        cursor.execute(string)
        print(string)
        printNode = printNode.nextNode

    cursor.execute('SELECT * FROM COMMITS;')
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

