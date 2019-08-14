# frozen_string_literal: true

require 'spec_helper'
require 'pg'

feature 'Viewing Bookmarks' do
  let(:url1) { 'http://www.makersacademy.com' }
  let(:url2) { 'http://www.destroyallsoftware.com' }
  let(:url3) { 'http://www.google.com' }
  let(:title1) { 'Makers Academy Homepage' }
  let(:title2) { 'Destroy all Software' }
  let(:title3) { 'Google Homepage' }

  scenario 'Welcome message is displayed' do
    visit '/'
    expect(page).to have_content 'Your Bookmarks:'
  end

  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    add_bookmark(url1, title1)
    add_bookmark(url2, title2)
    add_bookmark(url3, title3)

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy all Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
