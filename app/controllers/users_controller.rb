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

private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :birthday, :password, :password_confirmation)
  end

end
