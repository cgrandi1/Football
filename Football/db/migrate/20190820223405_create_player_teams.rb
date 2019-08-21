class CreatePlayerTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :player_teams do |t|
      t.integer :player_id
      t.integer :league_id

      t.timestamps
    end
  end
end
