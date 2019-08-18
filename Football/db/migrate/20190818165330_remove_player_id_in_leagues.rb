class RemovePlayerIdInLeagues < ActiveRecord::Migration[5.2]
  def change
    remove_column :leagues, :player_id
  end
end
