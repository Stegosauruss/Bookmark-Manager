# Bookmark-Manager
##How to use:
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

##User Stories

Show a list of bookmarks
```
As a user
So that I can visit my favourite websites
I'd like to display a list of bookmarks
```
DOMAIN MODEL
Client ----> Get '/bookmarks' ------>   Controller -----> /lib/Bookmark
                                                :bookmark info

                                        Controller <----- 
                                        Controller ----------------------> erb :bookmarks

                                        Controller <---------------------- erb :bookmarks
Client <---- Response: <-----            Controller     
            :Bookmark
            :Name
            :Link
            :Description            





Add new bookmarks
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users are restricted to manage only their own bookmarks