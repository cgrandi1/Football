class FantasyLeague < ApplicationRecord

    def index 
        @fantasy_leagues = Fantasy_league.all
    end 
end
