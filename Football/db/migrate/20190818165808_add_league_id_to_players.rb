class AddLeagueIdToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :league_id, :integer
  end
end
