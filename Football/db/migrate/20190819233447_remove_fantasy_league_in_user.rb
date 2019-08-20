class RemoveFantasyLeagueInUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :fantasy_league_id
  end
end
