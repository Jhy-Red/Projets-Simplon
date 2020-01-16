import mysql.connector as mariadb
import csv 
import argparse


# placement de la data : maria
mariadb_connection = mariadb.connect(user='root', password='root', database='movie_predictor_pure')
cursor = mariadb_connection.cursor()

#Extraction visuel des données
def exercice_1() :
        cursor.execute('SELECT * FROM movies')
        result=cursor.fetchall()
        c = csv.writer(open('dbmarialight.csv', 'wb'))
        for x in result:
                print (x)

print(exercice_1())
# mise en place de parse
def exercice_2() :
        parser = argparse.ArgumentParser()
        parser.add_argument("echo")
        parser.parse_args()
