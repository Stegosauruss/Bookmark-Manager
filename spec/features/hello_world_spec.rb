# frozen_string_literal: true

require 'spec_helper'

feature 'test hello world path' do
  scenario 'Hello world is displayed' do
    visit '/'
    expect(page).to have_content 'Hello, world!'
  end
end
