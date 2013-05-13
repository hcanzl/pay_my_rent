require 'spec_helper'

feature 'Creating Users' do
  scenario "can create user" do
    visit '/'
    click_link 'New User'
    fill_in 'Email', :with => 'sampleuser@example.com'
    fill_in 'Name', :with => 'John Doe'
    fill_in 'Phone', :with => '206-253-2222'
    fill_in 'Username', :with => 'JohnD'
    fill_in 'Password', :with => 'abcdef'
    click_button 'Create User'

    page.should have_content('User has been created.')
  end
end
