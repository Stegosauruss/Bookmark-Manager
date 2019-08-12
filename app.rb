require "sinatra/base"
require './lib/bookmark.rb'

class BookmarkWeb < Sinatra::Base
  get '/' do
  "Hello, world!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end