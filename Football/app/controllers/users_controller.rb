class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id  #logs in the user
             redirect_to user_leagues_path(@user.leagues)
        else 
            flash[:message] = "Please Try Again!"
            redirect_to root_path 
        end 
    end 

    def show
        if logged_in?
          @user = current_user
          redirect_to user_leagues_path(@user)
        else
          redirect_to root_path
        end
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
    end 

    # def only_see_own_page
    #     @user = User.find(params[:id])
      
    #     if current_user != @user
    #       redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    #     end
    # end
end
