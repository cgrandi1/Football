class LeaguesController < ApplicationController
    before_action :require_login

    def index
        @leagues = current_user.leagues
        #@leagues = League.all
    end 

    def new 
        @league = League.new
    end 

    def create 
        @league = League.new(league_params)
        if @league.valid?
            @league.save
            redirect_to league_path(@league)
        else 
            flash[:message] = "Missing info a field"
            redirect_to root_path 
        end 
    end 

    def show
        @league = League.find_by(id: params[:id])
        @user = current_user
    end 

    def edit 
        @league = League.find_by(id: params[:user_id])
    end 

    def update 
        @league = League.find_by(id: params[:user_id])
        @league.update(league_params)
        @league.save
        redirect_to user_league_path(@league)
    end 

    private

    def league_params
        params.require(:league).permit(:name, :cost, :people_in_league, :user_id)
    end 
end
