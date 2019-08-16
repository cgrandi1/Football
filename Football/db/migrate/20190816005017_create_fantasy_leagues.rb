class CreateFantasyLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :fantasy_leagues do |t|
      t.string :name
      t.integer :cost
      t.integer :people_in_league
      t.integer :player_id
      t.integer :user_id

      t.timestamps
    end
  end
end
