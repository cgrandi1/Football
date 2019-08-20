class Team < ApplicationRecord

    belongs_to :user
    belongs_to :league

    has_many :players

    def players_attributes=(player)
        self.player = Player.find_or_create_by(name: player[:name])
        self.player.update(player)
    end 
end
