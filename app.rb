# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkWeb < Sinatra::Base
  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/new' do
    p "Form data submitted to the /bookmarks route!"
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
