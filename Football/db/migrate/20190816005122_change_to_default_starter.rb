class ChangeToDefaultStarter < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :starter, :boolean, default: false
  end
end
