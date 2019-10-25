class AddHomeTeamCurrentPlayersToScoreboards < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :home_team_current_players, :string
  end
end
