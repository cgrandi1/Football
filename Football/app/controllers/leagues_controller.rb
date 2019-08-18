class LeaguesController < ApplicationController

    def index
        @leagues = League.all
    end 

    def new 
        @league = League.new
    end 

    def create 
        @league = League.new(league_params)
        # @fantasy = Fantasy_League.find_by(id: params[:user][fantasy_league_id])
        if @league.valid?
            @league.save
            redirect_to user_league(@league)
        else 
            redirect_to root_path 
        end 
    end 

    def show
        @league = League.find_by(id: params[:id])
        @user = current_user
        redirect_to user_league_player_path(@league, @uuser)
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
