class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        # @fantasy = Fantasy_League.find_by(id: params[:user][fantasy_league_id])
        if @user.valid?
            @user.save
            redirect_to user_leagues_path(@user)
        else 
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
