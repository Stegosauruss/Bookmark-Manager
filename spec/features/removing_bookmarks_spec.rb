require 'spec_helper'
require 'pg'

feature 'Removing Bookmarks' do
  scenario 'A user can delete bookmarks' do
    visit '/bookmarks'
    add_bookmark('https://rubular.com', 'Ruby RegEx Editor')
    add_bookmark('https://github.com', 'Git Hub Homepage')
    click_button 'Delete Ruby RegEx Editor'

    expect(page).not_to have_link('Ruby RegEx Editor', href: 'https://rubular.com')
    expect(page).to have_link('Git Hub Homepage', href: 'https://github.com')
  end
end