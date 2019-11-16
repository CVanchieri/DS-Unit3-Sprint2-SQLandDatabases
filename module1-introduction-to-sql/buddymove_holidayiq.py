# -*- coding: utf-8 -*-
# Assigment - Part 2, Making and populating a Database.

# import pandas library.
import pandas as pd

# read in the csv file.
df = pd.read_csv("https://raw.githubusercontent.com/CVanchieri/DS-Unit-3-Sprint-2-SQL-and-Databases/master/module1-introduction-to-sql/buddymove_holidayiq.csv")
# show the data frame shape.
print(df.shape)
# show the data frame with headers.
df.head()

# import sqlite3 library.
import sqlite3

# create connection to file.
conn = sqlite3.connect('buddymove_holidayiq.sqlite3')

# create the cursor.
cur = conn.cursor()

# use df.t_sql() to change the df to sql. 
df.to_sql('BuddyMoveHoliday', conn, if_exists='replace', index = False)

# .commit().
conn.commit()
### 1.Count how many rows you have - it should be 249!"""
# how many rows in the table.
query = """
        SELECT count(*) 
        FROM BuddyMoveHoliday
        """
cur.execute(query).fetchall()

### 2.How many users who reviewed at least 100 Nature in the category also reviewed at least 100 in the Shopping category?"""
# how many users reviewed >= 100 Nature & Shopping categories.
query = """
        SELECT count(*) 
        FROM BuddyMoveHoliday 
        WHERE Nature >= 100 AND Shopping >= 100
        """
cur.execute(query).fetchall()

### 3.(Stretch) What are the average number of reviews for each category?"""
# what is the average number of reviews for each category.
query = """
        SELECT AVG(Sports), AVG(Religious), AVG(Nature), AVG(Theatre), AVG(Shopping), AVG(Picnic) 
        AS Average 
        FROM BuddyMoveHoliday
        """
cur.execute(query).fetchall()