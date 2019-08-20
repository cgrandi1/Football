class RemoveLeagueIdFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :league_id
  end
end
