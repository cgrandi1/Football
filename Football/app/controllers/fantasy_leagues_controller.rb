class FantasyLeaguesController < ApplicationController

    def index
        @fantasy_leagues = Fantasy_League.all
    end 

    def new 
        session[:id] = params[:user_id]
        @fantasy_league = Fantasy_League.new
    end 

    def create 
        @fantasy_league = Fantasy_League.new(league_params)
        @fantasy_league.save
        redirect_to user_fantasy_leagues_path
    end 

    def update 
        @fantasy_league = Fantasy_League.find_by(id: params[:user_id])
        @fantasy_league.update(league_params)
        @fantasy_league.save
        redirect_to attraction_path(@attraction)
    end 

    private

    def league_params
        params.require(:fantasy_league).permit(:name, :cost, :people_in_league, :user_id)
    end 
end
