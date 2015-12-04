class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Buyer.create(user_id: @user.id)
      Seller.create(user_id: @user.id)
      session[:user_id] = @user.id

      ExampleMailer.sample_email(@user).deliver_now

      redirect_to root_path
    else
      flash.now[:error] = "COULD NOT DAVE USER"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def feedback
    @user = User.find(params[:id])
    @buyerreviews =  @user.buyer.feedback_received
    @sellerreviews = @user.seller.feedback_received
  end

  def givefeedback
  end

private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :birthday, :password, :password_confirmation)
  end

end
