require 'spec_helper'
feature "Viewing users" do
  scenario "Listing all users" do
    user = Factory.create(:user, :name => "John Doe")
    visit '/'
    click_link 'John Doe'
    page.current_url.should == user_url(user)
  end
end
