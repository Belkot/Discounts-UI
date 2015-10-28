require 'rails_helper'

feature 'Offers tester' do
  before do
    Product.create code: 'FR', name: 'Fruit Tea', price: 3.11
    Product.create code: 'SR', name: 'Strawberries', price: 5.00
    Product.create code: 'CF', name: 'Coffe', price: 11.23
    Product.create code: 'AJ', name: 'Apple Juice',  price: 7.25
    RuleByOneGetOneFree.create product_code: 'FR'
    RuleDiscountIfOneByMore.create product_code: 'SR', min_count: 3, discount: 0.50
  end

  scenario 'scan products' do
    # Items: FR, SR, FR, FR, CF Total: $22.45

    visit root_path
    visit offers_tester_path

    products = page.find('.panel', text: 'Products').find('.panel-body').find('table')
    expect(products).to have_content 'Fruit Tea'
    expect(products).to have_content 'Strawberries'
    expect(products).to have_content 'Coffe'
    expect(products).to have_content 'Apple Juice'

    rules = page.find('.panel', text: 'Rules').find('.panel-body')
    expect(rules).to have_content 'By-one-get-one-free for Fruit Tea (FR).'
    expect(rules).to have_content 'Each Strawberries (SR) gets discounted $0.50 if one buy 3 or more of them.'

    checkout = page.find('#checkoutpartial')
    expect(checkout).not_to have_content 'Fruit Tea'
    expect(checkout).not_to have_content 'Strawberries'
    expect(checkout).not_to have_content 'Coffe'
    expect(checkout).not_to have_content 'Apple Juice'

    within rules do
      check('By-one-get-one-free for Fruit Tea (FR).')
      check('Each Strawberries (SR) gets discounted $0.50 if one buy 3 or more of them.')
    end

    tr_fr = products.find('tr', text: 'Fruit Tea')
    tr_sr = products.find('tr', text: 'Strawberries')
    tr_cf = products.find('tr', text: 'Coffe')

    within(tr_fr) { click_button 'Scan' }
    within(tr_sr) { click_button 'Scan' }
    within(tr_fr) { click_button 'Scan' }
    within(tr_fr) { click_button 'Scan' }
    within(tr_cf) { click_button 'Scan' }

    checkout = page.find('#checkoutpartial')
    expect(checkout).to have_content 'Fruit Tea'
    expect(checkout).to have_content 'Strawberries'
    expect(checkout).to have_content 'Coffe'
    expect(checkout).not_to have_content 'Apple Juice'
    expect(checkout).to have_content '$22.45'
  end

  scenario 'clear scaned products' do
    # Items: FR, FR Total: $3.11
    visit root_path
    visit offers_tester_path

    products = page.find('.panel', text: 'Products').find('.panel-body').find('table')
    expect(products).to have_content 'Fruit Tea'
    expect(products).to have_content 'Strawberries'
    expect(products).to have_content 'Coffe'
    expect(products).to have_content 'Apple Juice'

    rules = page.find('.panel', text: 'Rules').find('.panel-body')
    expect(rules).to have_content 'By-one-get-one-free for Fruit Tea (FR).'
    expect(rules).to have_content 'Each Strawberries (SR) gets discounted $0.50 if one buy 3 or more of them.'

    checkout = page.find('#checkoutpartial')
    expect(checkout).not_to have_content 'Fruit Tea'
    expect(checkout).not_to have_content 'Strawberries'
    expect(checkout).not_to have_content 'Coffe'
    expect(checkout).not_to have_content 'Apple Juice'

    within rules do
      check('By-one-get-one-free for Fruit Tea (FR).')
    end

    tr_fr = products.find('tr', text: 'Fruit Tea')

    within(tr_fr) { click_button 'Scan' }
    within(tr_fr) { click_button 'Scan' }

    checkout = page.find('#checkoutpartial')
    expect(checkout).to have_content 'Fruit Tea'
    expect(checkout).not_to have_content 'Strawberries'
    expect(checkout).not_to have_content 'Coffe'
    expect(checkout).not_to have_content 'Apple Juice'
    expect(checkout).to have_content '$3.11'

    within(checkout) {click_link 'Clear'}
    checkout = page.find('#checkoutpartial')
    expect(checkout).not_to have_content 'Fruit Tea'
    expect(checkout).not_to have_content 'Strawberries'
    expect(checkout).not_to have_content 'Coffe'
    expect(checkout).not_to have_content 'Apple Juice'
    expect(checkout).to have_content '$0.00'
  end
end
