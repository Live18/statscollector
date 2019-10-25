class AddAwayTeamCurrentPlayersToScoreboards < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :away_team_current_players, :string
  end
end
