class Team < ApplicationRecord

    belongs_to :user
    belongs_to :league

    has_many :players

    #accepts_nested_attributes_for :players


    def players_attributes=(attributes)
        attributes.each do |player_attribute|
            player = self.players.build(player_attribute[1])
            player.save
        end
    end 
end 



    #     self.player = Player.find_or_create_by(name: player[:name], position: player[:position], starter: player[:starter], fantasy_points: player[:fantasy_points])
    #     self.player.update(player)
    # end 
