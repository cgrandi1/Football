class ApplicationController < ActionController::Base

    def current_user
        User.find_by(id: session[:user_id])
    end 

    def logged_in?
        !!(current_user)
    end 

    def require_login
        unless logged_in?
          flash[:message] = "You must be logged in to access this page."
          redirect_to root_path
        end
    end
    
end
