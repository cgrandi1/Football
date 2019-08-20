class RemoveUserIdFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :user_id
  end
end
