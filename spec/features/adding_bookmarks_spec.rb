require 'spec_helper'
require 'pg'

feature 'Adding Bookmarks' do
  scenario 'A user can add bookmarks' do
    visit '/bookmarks'
    add_bookmark('https://rubular.com', 'Ruby RegEx Editor')
    expect(page).to have_link('Ruby RegEx Editor', href: 'https://rubular.com')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    fill_in('title', with: 'not a real title')
    click_button('Submit')
  
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end

