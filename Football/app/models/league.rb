class League < ApplicationRecord
    has_many :teams
    belongs_to :user

    validates :name, presence: true 
    validates :cost, presence: true
    validates :people_in_league, presence: true

    #params in new league,
    
    scope :order_name, -> { order(name: :asc) }

end

