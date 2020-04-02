class UsersController < ApplicationController
#Do not have to be an authorized user (logged in) to create a new user
  skip_before_action :authorized, only: [:new, :create]
#The minimum length for created password
  MIN_PASS_LENGTH = 12
  
#adds the new user to the database
#Path: /users/new (users_new)
  def new
    @user = User.new
  end

#identifies if the password is good strong enough
  #add a dictionary attack prevention?
  #now that I think about it, there is probably a gem for this
#Path: N/A
def password_reqs? 
    pass = params[:user][:password]
    notice = []
    still_true = true

    if pass.length < MIN_PASS_LENGTH
      notice << "Please use a longer password (at least #{MIN_PASS_LENGTH} characters).<br/>"
      still_true = false
    end
    if pass.index( /[^[:alnum:]]/ ) == nil
      notice << "Please include a symbol.<br/>"
      still_true = false
    end
    if pass.index( /[0-9]/ ) == nil
      notice << "Please include a number.<br/>"
      still_true = false
    end
    if pass.index( /[a-z]/ ) == nil
      notice << "Please include a lowercase letter.<br/>"
      still_true = false
    end
    if pass.index( /[A-Z]/ ) == nil
      notice << "Please include an uppercase letter.<br/>"
      still_true = false
    end

    flash[:notice] = notice.join
  return still_true
  end

#Sanitizes user creation requests
#Path: /users/create (users_create)
  def create   
    if User.find_by(username: params[:user][:username]) != nil
      flash[:notice] = "Sorry, that account already exists."
      redirect_to '/users/new'
      else
        if password_reqs?
          @user = User.create(params.require(:user).permit(:username, :password))
          session[:user_id] = @user.id      
          redirect_to '/welcome'
          else
            redirect_to '/users/new'
        end
    end
  end

#are they logged in?
#Path: N/A
  def authorized
    if logged_in?
      return View("sessions/page_requires_login");    
    end
      return View("Index")
  end


  def user_profile
  end

  #parse the table into classes
def parseTable()
  table = params['table']
  classes = ""
  #Split by \n
  table = table.split("\n")
  #First 2 rows don't matter
  table.each do |string|
    #add it to the schedule
    string = /[MWFTR]+\s+\d{4}-\d{4}/.match(string).to_s.strip
    if string.include?('-')
      classes = classes + string + "\n"
    end
  end
  return classes
end

#parse classes into a schedule
def schedule(classes)
  #each day is an attribute with an array
  m=[]
  t=[]
  w=[]
  r=[]
  f=[]
  #if the day is in the begining add the times to the day
  classes = classes.split("\n")
  classes.each do |c|
      c = c.split("\t")
      if c[0].include?("M")
          m << c[1]
      end
      if c[0].include?("T")
          t << c[1]
      end
      if c[0].include?("W")
          w << c[1]
      end
      if c[0].include?("R")
          r << c[1]
      end
      if c[0].include?("F")
          f << c[1]
      end
  end
  return m,t,w,r,f
end
