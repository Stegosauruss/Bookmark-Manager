# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  let(:url1) { 'http://www.makersacademy.com' }
  let(:url2) { 'http://www.destroyallsoftware.com' }
  let(:url3) { 'http://www.google.com' }

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url1}');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url2}');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url3}');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end
