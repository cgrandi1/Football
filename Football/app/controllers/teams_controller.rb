class TeamsController < ApplicationController
    before_action :require_login


    
    def new 
        @user = current_user
        @league = League.find_by(id: params[:lesson_id])
        @team = Team.new
        binding.pry
        12.times { @team.players.build() }
    end
    

    def create 
        # @user = current_user
        # @league = League.find_by(id: params[:lesson_id])
        @team = Team.create(team_params)
        redirect_to user_league_team_path(@team.league.user, @team.league)

    end 

    def show 
        @team = Team.find(params[:id])
        @league = League.find_by(id: params[:league_id])
    end 

    def edit 
        @user = User.find_by(params[:user_id])
        @league = League.find_by(params[:league_id])
        @team = Team.find(id: params[:id])
    end 

    def update 
        @team = Team.find(params[:id])
        @team.update(team_params)
        @team.save
        redirect_to user_league_team_path(@league, @team)
    end 


    private

    def team_params
        params.require(:team).permit(:name, player_attributes: [:name, :position, :fantasy_points, :starter])
    end 
end
