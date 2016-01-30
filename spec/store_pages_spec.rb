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

feature "Adding a store" do
  scenario "allows the user to add a store" do
    visit('/')
    click_link 'Add a New Store'
    fill_in 'store_name', with: 'Test Store'
    click_button 'Submit'
    expect(page).to have_content('Test Store')
    click_link 'Home'
    click_link 'Test Store'
    click_link 'Edit Store'
    fill_in 'store_name', with: 'Test Store 2'
    fill_in 'brand_names', with: 'Brand'
    click_button 'Submit'
    expect(page).to have_content('Test Store 2')
    expect(page).to have_content('Brand')
  end
end
