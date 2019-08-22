class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id  #logs in the user
             redirect_to user_leagues_path(@user)
        else 
            flash[:message] = "Please Try Again! (Maxium Seriousness is 10 and no duplicate emails)"
            redirect_to root_path 
        end 
    end 

    def show
        if logged_in?
          @user = current_user
        else
          redirect_to root_path
        end
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :age, :seriousness_level, :email, :password, :password_confirmation)
    end 
end
