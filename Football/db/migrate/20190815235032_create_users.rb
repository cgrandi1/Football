class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :seriousness_level
      t.integer :fantasy_league_id

      t.timestamps
    end
  end
end
