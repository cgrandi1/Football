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
        @team = Team.create(team_params)
        @team.user = current_user
        redirect_to user_league_team_path(@league, @team)
    end 

    def show 
        @league = League.find_by(id: params[:league_id]) 
        @user = current_user
        @team = Team.find_by(id: params[:id])
    end 

    private

    def team_params
        params.require(:team).permit(:name, :league_id, :user_id, players_attributes: [:name, :position, :fantasy_points, :starter])
    end 
end
