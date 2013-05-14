class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "User has been created."
      redirect_to @user
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
end
