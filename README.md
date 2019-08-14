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

Add new bookmarks
```
As a user
So that I can store websites for later
I want to add bookmarks to the bookmark manager
```

Delete bookmarks
```
As a user
So that I can keep my bookmarks manageable
I want to remove bookmarks from the bookmark manager
```

Update bookmarks
```
As a user
So that my bookmarks don't go out of date
I want to update the information about my bookmarks
```

Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users are restricted to manage only their own bookmarks

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