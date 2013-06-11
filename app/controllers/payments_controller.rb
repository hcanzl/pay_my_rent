class PaymentsController < ApplicationController

  before_filter :find_user
  before_filter :find_payment, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @payment = @user.payments.builduser_i
    #@ticket = @project.tickets.build
  end

  def show
  end

  def create
    @payment = @user.payments.build(params[:payment])
    @payment.user = current_user

    if @payment.save
      flash[:notice] = "Payment has been created."
      redirect_to [@user, @payment]
    else
      flash[:alert] = "Payment has not been created."
      render :action => "new"
    end
  end

  private
    def find_user
      @user = User.find(params[:user_id])
      #@user = User.for(current_user).find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The User you were looking " +
                      "for could not be found."
      redirect_to root_path

    end

    def find_payment
      @payment = @user.payments.find(params[:id])
      #@ticket = @project.tickets.find(params[:id])
      #new_user_payment GET    /users/:user_id/payments/new(.:format)      payments#new
      #new_project_ticket GET  /projects/:project_id/tickets/new(.:format)          tickets#new


      #@ticket = @project.tickets.find(params[:id])
    end
end
