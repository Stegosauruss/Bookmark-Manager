# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = self.connect
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    connection = self.connect
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private

  def self.connect
    if self.testing?
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.testing?
    ENV['ENVIRONMENT'] == 'test'
  end
end


