require 'spec_helper'
require 'pg'

feature 'Adding Bookmarks' do
  scenario 'A user can add bookmarks' do
    visit '/bookmarks'
    add_bookmark('https://rubular.com', 'Ruby RegEx Editor')
    expect(page).to have_link('Ruby RegEx Editor', href: 'https://rubular.com')
  end
end