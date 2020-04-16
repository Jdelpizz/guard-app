class UsersController < ApplicationController
#Do not have to be an authorized user (logged in) to create a new user
  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :has_profile?, only: [:new, :create]
#The minimum length for created password
  MIN_PASS_LENGTH = 12
  
#adds the new user to the database
#Path: /users/new (users_new)
  def new
    @user = User.new
  end



#Sanitizes user creation requests
#Path: /users/create (users_create)
  def create
    if (User.find_by(CWID: params[:user][:CWID]) != nil) || (User.find_by(username: params[:user][:username].downcase) != nil)
      flash[:notice1] = "Sorry, that account already exists."
      
      redirect_to '/users/new'
      else
        if password_reqs?
          if cwid?
            @user = User.create(params.require(:user).permit(:username, :password, :CWID))
            session[:user_id] = @user.id      
            redirect_to '/cadets/new'
          else
            redirect_to '/users/new'
          end
        else
          redirect_to '/users/new'
        end
    end
  end

  def cwid?
      if params[:user][:CWID].length == 8
        return true
      else
        flash[:notice3] = "Please enter your CWID"
        return false
      end
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

  flash[:notice2] = notice.join
  return still_true
end

#are they logged in?
#Path: N/A
  def profile
    @user = User.find_by(id: session[:user_id])
    flash[:username] = @user.username
    flash[:text_area_example] = "Class Schedule \nCourse 	Class Type 	Title 	Days 	Time 	Location 	Instructor \nAERO 402 	LEC 	Natl Secur Aff/Prep for AD II 	MWF 	0800-0850 	Jenkins Hall 305 	Yerage, Edward .\nELEC 330 	LEC 	Digital Systems Engr 	TR 	0930-1045 	Grimsley Hall 305 	Hayne, Ronald J.\nAERO 450 	LAB 	USAF Contract Training Lab 	R 	1600-1800 	Jenkins Hall 101 	Thurber, Kathleen .\nCSCI 421 	LEC 	Software Engineering Practicum 	TR 	1100-1215 	Thompson Hall 319 	Verdicchio, Michael P.\nCSCI 499 	IND 	Senior Research Project 				Banik, Shankar M.\nCRMJ 392 	OL1 	Cybercrime 				Navarro, Jordana ."
  end
  
#adds schedule to DB
  def add_schedule
    schedule = params[:schedule_field]
    if schedule == nil
      flash[:notice] = "Schedule Update Failed"
      redirect_to "/users/profile"
    else
      classes = parseTable(schedule)
      m,t,w,r,f = schedule(classes)
      puts "m: "
      puts m
      puts "t: "
      puts t
      puts "w: "
      puts w
      puts "r: "
      puts r
      puts "f: "
      puts f
      
      @cadet = Cadets.where(CWID: current_user.CWID)
      @cadet.update(monday: m)
      @cadet.update(tuesday: t)
      @cadet.update(wednesday: w)
      @cadet.update(thursday: r)
      @cadet.update(friday: f)
      flash[:notice] = "Schedule Updated"
      redirect_to "/users/profile"
    end
  end
  #parse the table into classes
  def parseTable(table)
    classes = ""
    #Split by \n
    table = table.split("\n")
    #First 2 rows don't matter
    table.each do |string|
      #add it to the schedule
      #Lesesne
      string1 = /([MWFTR])+\s+(\d{1,2}:\d{2} [ap]m) - (\d{1,2}:\d{2} [ap]m)/.match(string).to_s.strip
      #CAS
      string2 = /[MWFTR]+\s+\d{4}-\d{4}/.match(string).to_s.strip
      #if from Lesesne
      if string1.include?('-')
        #remove :
        string1.tr!(':','')
        #remove spaces
        string1.tr!(' ','')
        #convert to military time
        arr = []
        arr = string1.split('-')
        tmp =arr[0].split("\t")
        arr = [tmp[0],tmp[1],arr[1]]
        if arr[1].include?("p")
          arr[1].tr!('pm','')
          i = arr[1].to_i
          i=i+1200  unless i>=1200
          arr[1] = i.to_s
        end
        if arr[1].include?("a")
          arr[1].tr!('am','')
        end
        arr[1] = "0"+arr[1] unless arr[1].length == 4
        arr[1] = arr[1]+"-"
        if arr[2].include?("p")
          arr[2].tr!('pm','')
          i = arr[2].to_i
          i=i+1200 unless i>=1200
          arr[2] = i.to_s
        end
        if arr[2].include?("a")
          arr[2].tr!('am','')
        end
        arr[2] = "0"+arr[2] unless arr[2].length == 4
        string1 = arr[0]+"\t"+arr[1]+arr[2]
        classes = classes + string1 + "\n"
      end
      #if from CAS
      if string2.include?('-')
        classes = classes + string2 + "\n"
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
end