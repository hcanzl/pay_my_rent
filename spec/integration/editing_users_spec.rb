require 'spec_helper'
feature "Editing Users" do
  before do
    Factory(:user, :name => "John Doe")
    visit "/"
    click_link "John Doe"
    click_link "Edit User"
  end

  scenario "Updating a user" do
    fill_in "Name", :with => "John S. Doe"
    click_button "Update User"
    page.should have_content("User has been updated.")
  end

  scenario "Updating a user with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update User"
    page.should have_content("User has not been updated.")
  end
end
