require 'spec_helper'

feature "Creating Payments" do
  before do
    Factory(:user, :name => "John Doe")
    user = Factory(:user, :email => "pay_my_rent@example.com")
    user.confirm!

    sign_in_as!(user)
    visit '/'
    click_link "John Doe"
    click_link "New Payment"
    within("h2") { page.should have_content("New Payment") }
  end

  scenario "Creating a Payment" do
    fill_in "Amount", :with => "400"
    fill_in "Payment date", :with => "4/5/2012"
    click_button "Create Payment"
    save_and_open_page
    page.should have_content("Payment has been created.")

    within("#payment #author") do
      page.should have_content("Created by pay_my_rent@example.com")
    end
  end

  scenario "Amount must be greater than 0" do
    fill_in "Payment date", :with => "3/5/2012"
    fill_in "Amount", :with => "-10"
    click_button "Create Payment"
    page.should have_content("Payment has not been created.")
    page.should have_content("Amount must be greater than 0")
  end
end
