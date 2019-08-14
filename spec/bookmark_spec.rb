# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  let(:url1) { 'http://www.makersacademy.com' }
  let(:url2) { 'http://www.destroyallsoftware.com' }
  let(:url3) { 'http://www.google.com' }

  it 'returns a list of bookmarks' do
    Bookmark.create(url: url1)
    Bookmark.create(url: url2)
    Bookmark.create(url: url3)
    bookmarks = Bookmark.all

    expect(bookmarks).to include(url1)
    expect(bookmarks).to include(url2)
    expect(bookmarks).to include(url3)
  end
end

describe '#create' do
  it 'creates a new url' do
    Bookmark.create(url: "https://rubular.com")
    bookmarks = Bookmark.all

    expect(bookmarks).to include("https://rubular.com")
  end
end