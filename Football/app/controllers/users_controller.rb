class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        fantasy = Fantasy.find_by(id: params[:user_id])
        if @user.valid?
            if session[:user_id] = @user.id
                @user.save
                redirect_to user_fantasy_leagues_path(fantasy)
            else 
                redirect_to root_path
            end 
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

    end 
end
