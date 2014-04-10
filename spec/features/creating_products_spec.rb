require 'spec_helper'

feature 'Products management' do
  scenario 'User creates new product' do
    visit new_product_path

    fill_in 'Name', with: 'Apple'
    fill_in 'Description',
      with: 'Buy some of our delicious apples, they keep the doctor away!'
    fill_in 'Image URL', with: '/pics/apple.png'
    fill_in 'Price', with: 5.99
    click_on 'Create Product'

    expect(page).to have_content("Product was successfully created")
  end
end