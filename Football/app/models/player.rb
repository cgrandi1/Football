class Player < ApplicationRecord

    belongs_to :user
    belongs_to :league

    def mulitple_positions
        self.position.create(position: "RB", "QB", "TE", "WR", "DEF", "K")
    end
end
