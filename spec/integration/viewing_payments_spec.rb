require 'spec_helper'

feature "Viewing payments" do
  before do
    John = Factory(:user, :name => "John")
    Factory(:payment,
    :user => John,
    :amount => "300",
    :payment_date => "2012-01-03")
    Paul = Factory(:user, :name => "Paul")

    Factory(:payment,
    :user => Paul,
    :amount => "500",
    :payment_date=> "2012-02-03")
    visit '/'
  end

  scenario "Viewing payments for a given user" do
    click_link "John"
    page.should have_content("300")
    page.should_not have_content("500")

    click_link "1"
    page.should have_content("300")
    page.should have_content("2012-01-03")
  end
end
