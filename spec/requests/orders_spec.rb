require 'spec_helper'
require 'capybara/rails'

describe "Orders" do
  describe "GET /orders" do
    it "displays welcome text" do
      visit orders_path
      #response.status.should be(200)
      #binding.pry
      #page.save_and_open_page
      page.should have_content "Listing orders"
    end
    it "displays new order button" do
      visit orders_path
      page.should have_content "New order"
      click_link "New order"
    end
  end
  describe "POST /orders" do
    it "creates order" do
      visit new_order_path
      fill_in "Customer name", :with => "test customer name"
      fill_in "Size", :with => "medium"
      fill_in "Toppings", :with => "pepperoni, sausage"
      click_button "Create Order"
      page.should have_content "test customer name"
      page.should have_content "medium"
      page.should have_content "pepperoni, sausage"
    end
  end

end
