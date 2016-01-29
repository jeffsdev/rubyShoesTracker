require 'spec_helper'

feature "Adding a store" do
  scenario "allows the user to add a store" do
    visit('/')
    click_link 'Add a New Store'
    fill_in 'store_name', with: 'test store'
    click_button 'Submit'
    expect(page).to have_content('test store')
  end
end
