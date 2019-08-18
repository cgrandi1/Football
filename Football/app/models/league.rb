class League < ApplicationRecord
    belongs_to :user
    has_many :players

    validates :name, presence: true 
    validates :cost, presence: true
    validates :people_in_league, presence: true

end
