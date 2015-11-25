require 'rails_helper'

RSpec.describe "Orders page", type: :feature do
  feature "Exporting orders to CSV" do
    background do
      create_list(:order, 10)
    end

    scenario "Exporting all orders", js: true, sidekiq: :inline do
      visit orders_path
      check 'select_all'
      click_on 'Generate CSV'

      expect(page).to have_content 'Download CSV'
    end 
  end
end