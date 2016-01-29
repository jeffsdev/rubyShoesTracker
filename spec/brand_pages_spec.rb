require 'spec_helper'

feature "Adding a brand" do
  scenario "allows the user to add a brand" do
    visit('/')
    click_link 'Add a New Brand'
    fill_in 'brand_name', with: 'test brand'
    click_button 'Submit'
    expect(page).to have_content('test brand')
  end
end
