class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  skip_before_action :has_profile?, only: [:new, :create, :welcome, :logout]
  #The get request when a user goes to login
  #Path: /login (login)
  def new
  
  end

#might be used by the logged_in?() function, don't really know though
#Path: /sessions_login
#  def login
#    if session[:user_id] != nil
#      redirect_to '/welcome'
#    else
#      redirect_to '/login' 
#    end
#  end
  
  def logout
    session[:user_id] = nil
      redirect_to '/welcome'
  end

  #Creates the user session on login
    #the post of /login
  #Path: /login (login)
  def create
      @user = User.find_by(username: params[:username].downcase)   
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id       
        if has_cadet?()      
          redirect_to '/welcome'
        else
          #redirect to create cadet
          redirect_to '/cadets/new'
        end
      else
        flash[:notice] = "Invalid Username or Password" 
        redirect_to '/login'
      end
  end

  

  #Unused
  #Path: /sessions/welcome (sessions_welcome)
  def welcome
    @user = User.find_by(id: session[:user_id])
    if @user == nil
      @username = "Please Sign In"
    else
      @username = @user.username
    end
  end
end
