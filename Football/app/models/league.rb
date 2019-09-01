class League < ApplicationRecord
    has_many :teams
    belongs_to :user

    validates :name, presence: true 
    validates :cost, presence: true
    validates :people_in_league, presence: true

    #params in new league,
    
    scope :order_name, -> { order(name: :asc) }

    scope :most_leagues, -> { User.joins(:leagues).group(:user_id).order(:league_id).count }

end

