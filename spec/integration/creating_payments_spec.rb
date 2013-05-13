require 'spec_helper'

feature 'Creating Payments' do
  scenario "can create paymentr" do
    visit '/'
    click_link 'New Payment'
    fill_in 'Amount', :with => '1750.75'
    fill_in 'Date', :with => ''
    click_button 'Create Payment'

    page.should have_content('Payment has been created.')
  end
end
