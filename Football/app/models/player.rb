class Player < ApplicationRecord

    def mulitple_positions
        self.position.create(position: "RB", "QB", "TE", "WR", "DEF", "K")
    end
end
