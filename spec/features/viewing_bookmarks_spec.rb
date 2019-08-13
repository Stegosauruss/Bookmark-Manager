# frozen_string_literal: true

require 'spec_helper'
require 'pg'

feature 'Bookmarks manager' do
  let(:url1) { 'http://www.makersacademy.com' }
  let(:url2) { 'http://www.destroyallsoftware.com' }
  let(:url3) { 'http://www.google.com' }

  scenario 'Welcome message is displayed' do
    visit '/'
    expect(page).to have_content 'Your Bookmarks:'
  end
  
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, '#{url1}');")
    connection.exec("INSERT INTO bookmarks VALUES(2, '#{url2}');")
    connection.exec("INSERT INTO bookmarks VALUES(3, '#{url3}');")

    visit('/bookmarks')

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
