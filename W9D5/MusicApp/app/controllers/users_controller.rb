class UsersController < ApplicationController

  def create 
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else 
      flash.now[:errors] = @user.errors.full_messages 
      render :new
    end 
  end
  
  def show 
    render :show
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