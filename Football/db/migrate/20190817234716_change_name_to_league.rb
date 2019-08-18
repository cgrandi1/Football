class ChangeNameToLeague < ActiveRecord::Migration[5.2]
  def change
    rename_table :fantasy_leagues, :leagues
  end
end
