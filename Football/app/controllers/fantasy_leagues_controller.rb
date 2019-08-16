class FantasyLeaguesController < ApplicationController

    def new
        @fantasy_leagues = Fantasy_league.all
    end 
end
