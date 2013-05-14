require 'spec_helper'

feature 'Creating Users' do
  before do
    visit '/'
    click_link 'New User'
  end

  scenario "can create user" do
    fill_in 'Email', :with => 'sampleuser@example.com'
    fill_in 'Name', :with => 'John Doe'
    fill_in 'Phone', :with => '206-253-2222'
    click_button 'Create User'

    page.should have_content('User has been created.')

    user = User.find_by_name("John Doe")
    page.current_url.should == user_url(user)
    title = "John Doe - Users - PayMyRent"
    find("title").should have_content(title)
  end
end

feature 'Creating Users - Blank Fields' do
  before do
    visit '/'
    click_link 'New User'
    click_button 'Create User'
    page.should have_content("User has not been created.")
  end

  scenario "can not create a user without an email" do
    page.should have_content("Email can't be blank")
  end

  scenario "can not create a user without a name" do
    page.should have_content("Name can't be blank")
  end

  scenario "can not create a user without a phone" do
    page.should have_content("Phone can't be blank")
  end
end
