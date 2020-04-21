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

#Allow user to add schedule
#Path: /users/profile
  def profile
    @user = User.find_by(id: session[:user_id])
    @username = @user.username
    @text_area_example = "Class Schedule \nCourse 	Class Type 	Title 	Days 	Time 	Location 	Instructor \nAERO 402 	LEC 	Natl Secur Aff/Prep for AD II 	MWF 	0800-0850 	Jenkins Hall 305 	Yerage, Edward .\nELEC 330 	LEC 	Digital Systems Engr 	TR 	0930-1045 	Grimsley Hall 305 	Hayne, Ronald J.\nAERO 450 	LAB 	USAF Contract Training Lab 	R 	1600-1800 	Jenkins Hall 101 	Thurber, Kathleen .\nCSCI 421 	LEC 	Software Engineering Practicum 	TR 	1100-1215 	Thompson Hall 319 	Verdicchio, Michael P.\nCSCI 499 	IND 	Senior Research Project 				Banik, Shankar M.\nCRMJ 392 	OL1 	Cybercrime 				Navarro, Jordana ."
  end
  
#adds schedule to DB
  def add_schedule
    schedule = params[:schedule_field]

     if schedule != nil
      classes = parseTable(schedule)
      m,t,w,r,f = schedule(classes)  
      @cadet = Cadets.where(CWID: current_user.CWID)
      create_enrollment_entry(m, "monday")
      create_enrollment_entry(t, "tuesday")
      create_enrollment_entry(w, "wednesday")
      create_enrollment_entry(r, "thursday")
      create_enrollment_entry(f, "friday")
      flash[:notice] = "Schedule Updated"
    # else
    #   flash[:notice] = "Schedule Update Failed" [DOES NOT SEEM NESSESARY]
     end
     redirect_to "/users/profile"
  end
  
  def class_entry(time_arr, day)
     classes = Classes.where(DAY: day.upcase)
    time_arr.each do |time|
               #remove spaces (there shouldn't be in the first place)
                    time.tr!(" ","")
               #split the start and end times
                    time = time.split("-")
               #all classes with the same start times
                     tmp_classes = classes.where(START_TIME: time[0])
               #If class exists do nothing, if it doesn't exist add it
                if tmp_classes.where(END_TIME: time[1]).take != nil
                    return true
                else classes.create(DAY: day.upcase, START_TIME: time[0], END_TIME: time[1])
                end
   
          end
  end
  
  def create_enrollment_entry(time_arr, day)
    cwid = current_user.CWID
    class_id = class_entry(time_arr, day) 
    if Enrollments.where(CWID: cwid).where(CLASS_ID: class_id).take == nil
      Enrollments.create(CWID: cwid, CLASS_ID: class_id)
      return true
    else 
      return false
    end
  end
  #parse the table into classes
  def parseTable(table)
    classes = ""
    #Split each line
      table = table.split("\n")
    #parse each row from the table into classes per day
        table.each do |string|
        #add it to the schedule
          #Lesesne regex
            string1 = /([MWFTR])+\s+(\d{1,2}:\d{2} [ap]m) - (\d{1,2}:\d{2} [ap]m)/.match(string).to_s.strip
          #CAS regex
            string2 = /[MWFTR]+\s+\d{4}-\d{4}/.match(string).to_s.strip
          #parse from Lesesne
            if string1.include?('-')
              string1=parse_lesesne(string1)
              classes = classes + string1 + "\n"
            end
          #parse from CAS
            if string2.include?('-')
              classes = classes + string2 + "\n"
            end
          end
    return classes
  end

  
  def parse_lesesne(str)
    arr = prep_lesesne_str(str)
    if arr[1].include?("p")
      arr[1] = parse_pm(arr[1])
    end
    if arr[1].include?("a")
      arr[1] = parse_am(arr[1])
    end
    # add hyphen
      arr[1] = arr[1]+"-"
    if arr[2].include?("p")
      arr[2] = parse_pm(arr[2])
    end
    if arr[2].include?("a")
      arr[2] = parse_am(arr[2])
    end
    # combine and return
      str = arr[0]+"\t"+arr[1]+arr[2] 
    return str
  end

  #prep string for parsing [days,time1,time2]
  def prep_lesesne_str(str)
    #remove :
      str.tr!(':','')
    #remove spaces
      str.tr!(' ','')
    #convert string to arr[string] for parse
      arr = []
      arr = str.split('-')
      tmp =arr[0].split("\t")
      arr = [tmp[0],tmp[1],arr[1]]
    return arr
 end

  #am -> military time
  def parse_am(str)
    #remove am
      str.tr!('am','')
    #pad to 4 digits
      str = "0"+str unless str.length == 4
    return str
  end

  #pm -> military time
  def parse_pm(str)
    #remove pm
      str.tr!('pm','')
    #add 1200 to time... unless it is 12.
      i = str.to_i
      i=i+1200  unless i>=1200
      str = i.to_s
    #pad to 4 digits
      str = "0"+str unless str.length == 4
    return str
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