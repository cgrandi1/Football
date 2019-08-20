class SessionsController < ApplicationController 

    def new 
    end 


    def create
        @user = User.find_by(email: params[:user_email])
        if @user && @user.authenticate(params[:password]) 
            if session[:user_id] = @user.id
                redirect_to leagues_path
            else 
                redirect_to 'root_path' 
            end
        end 
    end 

    def destroy 
        session.delte :user_id
        redirect_to root_path
    end 

end 
