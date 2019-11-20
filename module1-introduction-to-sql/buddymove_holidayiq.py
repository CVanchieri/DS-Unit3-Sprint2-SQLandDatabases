# Imports
import pandas as pd
import sqlite3

# Load the data in df and convert to sqlite3
df = pd.read_csv('https://raw.githubusercontent.com/CVanchieri/DS-Unit-3-Sprint-2-SQL-and-Databases/master/module1-introduction-to-sql/buddymove_holidayiq.csv')
# remove the space in 'User ID'.
df = df.rename(columns={'User Id': 'User_Id'})
# show the data frame shape.
print(df.shape)
# show the data frame with headers.
print(df.head())

# create connection.
conn = sqlite3.connect('buddymove_holidayiq.sqlite3')
# convert to sql.
df.to_sql('BuddyMoveHoliday', con=conn)

#1.count how many rows you have - it should be 249! #249
q1 = 'SELECT COUNT() \
          FROM  BuddyMoveHoliday;'
#2.How many users who reviewed at least 100 nature in the category also reviewed at least 100 in the shopping category?
q2 = 'SELECT COUNT(User_Id) \
          FROM BuddyMoveHoliday \
          WHERE Nature > 99 AND Shopping > 99;'
#3.(stretch) what are the average number of reviews for each category?
q3 = 'SELECT AVG(Sports), AVG(Religious), AVG(Nature), \
                 AVG(Theatre), AVG(Shopping), AVG(Picnic) \
          FROM BuddyMoveHoliday'

# Execute queries
curs1 = conn.cursor()
print('Total # of rows =',
      curs1.execute(q1).fetchall())

curs2 = conn.cursor()
print("Total # of reviews from 'BuddyMoveHoliday' (100+ Nature and 100+ Shopping) =",
      curs2.execute(q2).fetchall())

curs3 = conn.cursor()
print('Average # of reviews for each category =',
      curs3.execute(q3).fetchall())

# close cursors.
curs1.close()
curs2.close()
curs3.close()

# commit.
conn.commit()
