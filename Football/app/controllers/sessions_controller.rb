class SessionsController < ApplicationController 

    def new 
    end 


    def create
        @user = User.find_by(name: params[:user_name])
        if session[:id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end 
    end 


    def destroy 
        session.delte :user_id
        redirect_to root_path
    end 

end 
