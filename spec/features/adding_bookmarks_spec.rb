require 'spec_helper'
require 'pg'

feature 'Create Bookmarks' do
  scenario 'A user can add bookmarks' do
    visit '/bookmarks'
    click_button 'Add Bookmark'
    fill_in 'url', with: 'https://rubular.com'
    click_button 'Submit'
    expect(page).to have_content 'https://rubular.com'
  end
end