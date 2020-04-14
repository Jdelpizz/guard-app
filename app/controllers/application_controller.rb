class ApplicationController < ActionController::Base
    before_action :authorized
    before_action :has_profile?
    helper_method :current_user
    helper_method :logged_in?
    add_flash_types :notice1, :notice2, :notice3

    def current_user
        ::User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def authorized 
        redirect_to '/welcome' unless logged_in?        
    end

    def has_profile?
        if logged_in?
            redirect_to '/cadets/new' unless has_cadet?()
        else
            redirect_to '/welcome'
        end
    end

  def has_cadet?
    @user = current_user
    if ::Cadets.find_by(CWID: @user.CWID) != nil
      return true
    else
      return false
    end
  end

end
