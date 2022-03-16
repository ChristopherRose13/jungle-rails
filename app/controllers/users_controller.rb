class UsersController < ApplicationController
  def new
    puts "new"
  end

  def create
    puts "create"
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing up. Please check your password and email and try again"
      redirect_to '/signup'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end