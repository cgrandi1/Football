class SessionsController < ApplicationController 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user & @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_leagues_path(@user)
        else 
            flash[:message] = "Sorry Incorrect Email or Password. Please Try Again!"
            redirect_to 'root_path'
        end 
    end 

    def destroy 
        session.delete :user_id
        redirect_to 'root_path'
    end 


 

end 
