require "sinatra/base"
require './lib/bookmark.rb'

class Bookmark < Sinatra::Base
  get '/' do
  "Hello, world!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.new.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end