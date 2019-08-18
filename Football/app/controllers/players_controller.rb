class PlayersController < ApplicationController

    def new 
        @player = Player.new
        @league = League.find_by(id :params[:id])
        binding.pry
    end 

    def create 
        @player = Player.new(league_params)
        @player.save
        redirect_to user_league_path
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
