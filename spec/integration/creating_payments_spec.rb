require 'spec_helper'

feature "Creating Payments" do
  before do
    Factory(:user, :name => "John Doe")
    visit '/'
    click_link "John Doe"
    click_link "New Payment"
  end

  scenario "Creating a Payments" do
    fill_in "Amount", :with => "400"
    fill_in "Payment date", :with => "4/5/2012"
    click_button "Create Payment"
    page.should have_content("Payment has been created.")
  end

  scenario "Amount must be greater than 0" do
    fill_in "Payment date", :with => "3/5/2012"
    fill_in "Amount", :with => "-10"
    click_button "Create Payment"
    page.should have_content("Payment has not been created.")
    page.should have_content("Amount must be greater than 0")
  end

end
