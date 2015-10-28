require 'rails_helper'

feature 'Offers constructor' do
  scenario 'adds a new rule by-one-get-one-free' do
    visit root_path
    visit offers_constructor_path
    expect(page).not_to have_content 'FR'
    expect{
      fill_in 'rule_by_one_get_one_free_product_code', with: 'FR'
      within '#new_rule_by_one_get_one_free' do
        click_button 'Add'
      end
    }.to change(RuleByOneGetOneFree, :count).by(1)
    expect(page).to have_content 'FR'
  end

  scenario 'adds a new rule discount if one buys more' do
    visit root_path
    visit offers_constructor_path
    expect(page).not_to have_content 'FR'
    expect{
      fill_in 'rule_discount_if_one_by_more_product_code', with: 'FR'
      fill_in 'rule_discount_if_one_by_more_min_count', with: '3'
      fill_in 'rule_discount_if_one_by_more_discount', with: '1'
      within '#new_rule_discount_if_one_by_more' do
        click_button 'Add'
      end
    }.to change(RuleDiscountIfOneByMore, :count).by(1)
    expect(page).to have_content 'FR'
  end

  scenario 'adds a new product' do
    visit root_path
    visit offers_constructor_path
    expect(page).not_to have_content 'Fruit Tea'
    expect{
      fill_in 'product_code', with: 'FR'
      fill_in 'product_name', with: 'Fruit Tea'
      fill_in 'product_price', with: '3.11'
      within '#new_product' do
        click_button 'Add'
      end
    }.to change(Product, :count).by(1)
    expect(page).to have_content 'Fruit Tea'
  end

  scenario 'removes a product' do
    Product.create(code: 'SR', name: 'Strawberries', price: 5.00)
    visit root_path
    visit offers_constructor_path
    expect(page).to have_content 'Strawberries'
    expect{
      within '#productspartial' do
        click_link 'Remove'
      end
    }.to change(Product, :count).by(-1)
    expect(page).not_to have_content 'Strawberries'
  end


end
