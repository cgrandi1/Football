class RemoveSerious < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :seriousness_level
  end
end
