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

  post '/bookmarks/create' do
    p params
    Bookmark.create(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
