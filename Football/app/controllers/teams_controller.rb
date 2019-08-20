class TeamsController < ApplicationController

    def new 
        @league = League.find_by(id: params[:league_id])  
        @team = Team.new 
        14.times { @team.players.build() }
    end
    

    def create 
        @league = League.find_by(id: params[:league_id])
        @Team = Team.new(team_params)
        if @team.save
            redirect_to league_team_path(@league, @team)
        else 
            render :new
        end 
    end 

    def show 
        @team = Team.find(params[:id])
    end 

    def edit 
        @team = Team.find_by(id: params[:user_id])
    end 

    def update 
        @league = League.find_by(id: params[:league_id])
        @team = Team.find_by(id: params[:user_id])
        @team.update(league_params)
        @team.save
        redirect_to league_path(@league, @team)
    end 


    private

    def team_params
        params.require(:team).permit(:name, players_attributes: [:name, :position, :fantasy_points, :starter])
    end 
end
