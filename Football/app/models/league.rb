class League < ApplicationRecord
    has_many :teams
    has_many :users, :through => :teams

    validates :name, presence: true 
    validates :cost, presence: true
    validates :people_in_league, presence: true

    #params in new league, 

end

