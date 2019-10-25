class AddGameIdToScoreboards < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :game_id, :integer
  end
end
