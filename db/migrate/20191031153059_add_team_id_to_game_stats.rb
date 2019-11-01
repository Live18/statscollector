class AddTeamIdToGameStats < ActiveRecord::Migration[5.2]
  def change
    add_column :game_stats, :team_id, :integer
  end
end
