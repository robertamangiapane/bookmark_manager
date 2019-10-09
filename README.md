# bookmark_manager

This challenge involves building a web app, to store web bookmarks in a database.

# USER STORIES:

1. As a user, so that I can access websites that I visit frequently,

I want to be able to view a list of bookmarks.

2. As a user, so that I can save websites,

I would like to be able to save URLs and their title to Bookmark Manager


# DOMAIN MODEL:
1.
![Domain Model](https://imgur.com/a/IPJ183a)


#To set up the database
1. Install psql(activate postgresql - brew install postgresql)(to stop postgresql - brew services stop postgresql)(to restart brew services start postgresql)
2. Create database using psql command CREATE DATABASE bookmark_manager
3. Connect to database using psql command \c bookmark_manager
4. Run script in /db/migrations/    01_create_bookmarks_table.sql

#To set up the test environment
1. Create a test database using psql command CREATE DATABASE bookmark_manager_test
2. Repeat step 3 and 4 of the database set up to connect to the test database and create a test table.
