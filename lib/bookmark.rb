require 'pg'

class Bookmark
  def initialize
  end

  def all
    bookmarks = "Bookmarks: "
    bookmark_db = PG.connect( dbname: 'bookmark_manager')
    bookmark_db.exec( "SELECT * FROM bookmarks") do |result|
      result.each do |row|
        bookmarks << ("\n %s" % row.values_at('url'))
      end
    end
    bookmarks
  end
end