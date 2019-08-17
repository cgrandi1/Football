class SessionsController < ApplicationController 

    def new 
    end 


    def create 
        @user = User.find_by(id: params[:user_id])
        if @user && @user.authenticate(params [:user][:password]) 
            if session[:user_id] = @user.id
                redirect_to user_fantasy_leagues_path(@user)
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
