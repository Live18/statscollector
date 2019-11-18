class AddIsCompleteToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :is_complete, :boolean, :default => false
  end
end
