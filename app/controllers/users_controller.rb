class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create   
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def authorized
    if logged_in?
      return View("sessions/page_requires_login");    
    end
      return View("Index")
  end
end
