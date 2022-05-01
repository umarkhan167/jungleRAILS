require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end 
  end

  scenario "Once a product is added to cart, the cart shows that extra item being added" do

    visit root_path
    expect(page).to have_content('My Cart (0)')
    click_on('Add', match: :first)
    expect(page).to have_content('My Cart (1)')

  end
end
