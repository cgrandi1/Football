class League < ApplicationRecord
    has_many :players
    has_many :users, :through => :players

    validates :name, presence: true 
    validates :cost, presence: true
    validates :people_in_league, presence: true

end

