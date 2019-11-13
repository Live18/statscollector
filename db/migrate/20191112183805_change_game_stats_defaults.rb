class ChangeGameStatsDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column :game_stats, :pts, :integer, :default => 0
    change_column :game_stats, :reb, :integer, :default => 0
    change_column :game_stats, :ast, :integer, :default => 0
    change_column :game_stats, :stls, :integer, :default => 0
  end
end
