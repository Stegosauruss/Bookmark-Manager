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
    p 'Form data submitted to the /bookmarks route!'
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  post '/bookmarks/:id' do
    Bookmark.update(id: params[:id],title: params[:title],url: params[:url])
    redirect to '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
