class TeamsController < ApplicationController
    before_action :require_login


    
    def new 
        @user = current_user
        @league = League.find_by(id: params[:league_id])
        @team = Team.new
        12.times { @team.players.build() }
    end
    

    def create
        @league = League.find_by(id: params[:team][:league_id])
        @team = Team.new(team_params)
        @team.user = current_user
        @team.save
        redirect_to league_team_path(@league, @team)
    end 

    def show 
        @team = Team.find(params[:id])
        @league = League.find_by(id: params[:league_id])
    end 

    def edit 
        @user = current_user
        @league = League.find_by(id: params[:league_id])
        @team = Team.find(params[:id])
    end 

    def update 
        @team = Team.find(params[:id])
        @team.update(team_params)
        @team.save
        redirect_to league_team_path(@league, @team)
    end 


    private

    def team_params
        params.require(:team).permit(:name, :league_id, :user_id, players_attributes: [:name, :position, :fantasy_points, :starter])
    end 
end
