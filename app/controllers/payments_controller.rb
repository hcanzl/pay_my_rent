class PaymentsController < ApplicationController
  before_filter :find_user
  before_filter :find_payment, :only => [:show, :edit, :update, :destroy]

  def new
    @payment = @user.payments.build
  end

  def show
  end

  def create
    @payment = @user.payments.build(params[:payment])
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
    end

    def find_payment
      @payment = @user.payments.find(params[:id])
    end
end
