class UsersController < ApplicationController

  def create 
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to users_url
    else 
      flash.now[:errors] = @user.errors.full_messages 
      render :new
  end 

  def new
    @user = User.new
    render :new 
  end 

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end 
end 