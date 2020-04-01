class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  #The get request when a user goes to login
  #Path: /login (login)
  def new
  
  end

#might be used by the logged_in?() function, don't really know though
#Path: /sessions_login
  def login
    if session[:user_id] != nil
      redirect_to '/welcome'
    else
      redirect_to '/login' 
    end

  end
  
  def logout
    session[:user_id] = nil
      redirect_to '/welcome'
  end

  #Creates the user session on login
    #the post of /login
  #Path: /login (login)
  def create
    @user = User.find_by(username: params[:username])   
    if @user && @user.authenticate(params[:password])       
      session[:user_id] = @user.id      

      redirect_to '/spreadsheet/index' 
    else
      puts "hello?"       
      flash[:notice] = "Invalid Username or Password" 
      redirect_to '/login'
    end
  end

  #Unused
  #Path: /sessions/welcome (sessions_welcome)
  def welcome
    @user = User.find_by(id: session[:user_id])
    if @user == nil
      flash[:username] = "Please Sign In"
    else
      flash[:username] = @user.username
    end
  end
end
