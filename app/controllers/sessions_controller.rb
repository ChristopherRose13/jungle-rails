class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      # success logic, log them in
    else
      flash[:alert] = "There was a problem signing in. Please try again"
      # failure, render login form
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
        # If the user exists AND the password entered is correct.
  end

  def destroy
    
      session[:user_id] = nil
      redirect_to '/login'
    
  end

end