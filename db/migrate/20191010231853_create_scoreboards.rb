class CreateScoreboards < ActiveRecord::Migration[5.2]
  def change
    create_table :scoreboards do |t|
      t.integer :home_team_score
      t.integer :away_team_score
      t.integer :home_team_timeouts_remaining
      t.integer :away_team_timeouts_remining
      t.integer :period
      t.integer :home_team_fouls
      t.integer :away_team_fouls
      t.string :posession_arrow

      t.timestamps
    end
  end
end
