class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  
  end


  def login
    if session[:user_id] != nil
      redirect_to '/welcome'
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to '/login' 
    end

  end
  
  def logout
    session[:user_id] = nil
      redirect_to '/welcome'
  end

  def create
    @user = User.find_by(username: params[:username])   
    if @user && @user.authenticate(params[:password])       
      session[:user_id] = @user.id      
      redirect_to '/welcome'   
    else     
      flash[:notice] = "Invalid Username or Password" 
      redirect_to '/login'
    end
  end


  def welcome

  end
end
