require 'spec_helper'

feature "Deleting users" do
  scenario "Deleting a user" do
    Factory(:user, :name => "John Doe")
    visit "/"
    click_link "John Doe"
    click_link "Delete User"
    page.should have_content("User has been deleted.")
    visit "/"
    page.should_not have_content("John Doe")
  end
end
