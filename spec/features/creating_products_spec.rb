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

  scenario 'User edits a new product' do
    product = FactoryGirl.create(:product)

    visit "/products/#{product.id}/edit"

    fill_in 'Name', with: 'Apple'
    fill_in 'Description',
            with: 'Buy some of our delicious apples, they keep the doctor away!'
    fill_in 'Image URL', with: '/pics/apple.png'
    fill_in 'Price', with: 5.99
    click_on 'Update Product'

    expect(page).to have_content("Product was successfully updated")
  end

  scenario 'User views a product' do
    product = FactoryGirl.create(:product, price: 2350.42)

    visit product_path(product)

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.image_url)
    expect(page).to have_content("$2,350.42")
  end

  scenario 'User views a list of products' do
    product = FactoryGirl.create(:product, price: 2350.42)
    product2 = FactoryGirl.create(:product, price: 3456.42)

    visit products_path

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.image_url)
    expect(page).to have_content("$2,350.42")

    expect(page).to have_content(product2.name)
    expect(page).to have_content(product2.description)
    expect(page).to have_content(product2.image_url)
    expect(page).to have_content("$3,456.42")
  end

  scenario "User deletes a product" do
    product = FactoryGirl.create(:product)
    product2 = FactoryGirl.create(:product)

    visit products_path

    within("#product_#{product.id}") do
      click_link 'Destroy'
    end

    expect(page).to have_content("Product was removed")
  end
end
