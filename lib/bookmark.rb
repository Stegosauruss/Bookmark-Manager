require 'pg'

class Bookmark

  def self.all
    bookmark_db = PG.connect( dbname: 'bookmark_manager')
    result = bookmark_db.exec( "SELECT * FROM bookmarks") do |result|
      result.map { |bookmark| bookmark['url'] }
    end
  end
end