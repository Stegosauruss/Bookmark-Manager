# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark.rb'
require './database_connection_setup'
require 'uri'

class BookmarkWeb < Sinatra::Base
  database_connection_setup
  enable :sessions, :method_override
  register Sinatra::Flash

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

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  delete '/bookmarks/delete/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect to '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
