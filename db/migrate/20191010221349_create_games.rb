class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.date :date
      t.string :home_team
      t.string :away_team
      t.integer :scoreboard_id

      t.timestamps
    end
    add_index :games, [:home_team, :away_team]
  end
end
