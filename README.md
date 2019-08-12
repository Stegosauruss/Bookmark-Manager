# Bookmark-Manager

User Stories

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
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users are restricted to manage only their own bookmarks