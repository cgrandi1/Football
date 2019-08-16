class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.float :fantasy_points
      t.boolean :starter

      t.timestamps
    end
  end
end
