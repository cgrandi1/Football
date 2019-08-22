class LeaguesController < ApplicationController
    before_action :require_login

    def index
        @user = User.find_by(id: params[:user_id])
        if @user = current_user
            @user.leagues = League.all.order('name DESC')
        else 
            redirect_to root_path
        end 
    end 

    def new 
        @league = League.new
    end 

    def create 
        @user = current_user
        @league = League.create(league_params)
        if @league.valid?
            @league.save
            redirect_to league_path(@league)
        else 
            flash[:message] = "Missing info in a field"
            redirect_to root_path 
        end 
    end 

    def show
        @league = League.find(params[:id])
        @user = current_user
    end 

    def edit 
        @league = League.find(id: params[:id])
    end 

    def update 
        @league = League.find_by(id: params[:user_id])
        @league.update(league_params)
        @league.save
        redirect_to user_league_path(@league)
    end 

    def destroy
        @league = League.find(params[:id])
        @league.destroy
        redirect_to user_leagues_path
      end

    private

    def league_params
        params.require(:league).permit(:name, :cost, :people_in_league, :user_id)
    end 
end
