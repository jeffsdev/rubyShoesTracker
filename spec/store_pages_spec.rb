require 'spec_helper'

feature "Adding a store" do
  scenario "allows the user to add a store" do
    visit('/')
    click_link 'Add a New Store'
    fill_in 'store_name', with: 'Test Store'
    click_button 'Submit'
    expect(page).to have_content('Test Store')
  end
end
