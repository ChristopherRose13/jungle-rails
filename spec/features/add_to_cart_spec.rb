require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The user can add an item to the cart" do
    # ACT
    visit root_path

    # DEBUG
    save_and_open_screenshot
    first(".btn-primary").click
    # click_on 'Details', match: :first
    click_link(href: "/cart")
  

    # VERIFY
    expect(page).to have_content('My Cart (1)')
  end
end