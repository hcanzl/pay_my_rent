require 'spec_helper'

describe UsersController do
  it "displays an error for a missing user" do
    get :show, :id => "not-here"
    response.should redirect_to(users_path)
    message = "The user you were looking for could not be found."
    flash[:alert].should == message
  end
end
