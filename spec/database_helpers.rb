require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result
end

def add_bookmark(url, title)
  click_button 'Add Bookmark'
  fill_in 'url', with: url
  fill_in 'title', with: title
  click_button 'Submit'
end