require 'rails_helper'

RSpec.describe "Orders page", type: :feature do
  feature "Exporting orders to CSV", js: true do
    scenario "Exporting all orders" do 
      visit orders_path
      click_on '#select_all'
      click_on 'Generate CSV'

      expect(page).to have_content 'Download CSV'
    end 
  end
end