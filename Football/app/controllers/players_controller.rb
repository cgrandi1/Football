class PlayersController < ApplicationController

    def new 
        @player = Player.new    
    end
    
    def show 
        @players = Player.find(params[:id])
    end 

    def create 
        @league = League.find_by(id :params[:league_id])
        @player = Player.new(player_params)
        @player.save
        redirect_to league_player_path(@player)
    end 

    def edit 
        @player = Player.find_by(id: params[:user_id])
    end 

    def update 
        @player = Player.find_by(id: params[:user_id])
        @player.update(league_params)
        @player.save
        redirect_to user_league_path(@player)
    end 


    private

    def player_params
        params.require(:player).permit(:name, :position, :starter, :fantasy_points, :league_id, :user_id)
    end 
end
