class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  
  end


  def login
    if session[:user_id] != nil
      redirect_to '/welcome'
    else
      redirect_to '/login'   
      flash[:notice] = "Invalid Login"
    end

  end

  def create
 
    @user = User.find_by(username: params[:username])   
    if @user && @user.authenticate(params[:password])       
      session[:user_id] = @user.id      
      redirect_to '/spreadsheet/index' 
    else
      puts "hello?"       
      flash[:notice] = "Invalid Login" 
      redirect_to '/login'
    end
  end


  def welcome

  end
end
