class Player < ApplicationRecord

    has_many :teams
    has_many :leagues, :through => :player_id
  
end
