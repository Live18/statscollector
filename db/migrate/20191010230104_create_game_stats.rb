class CreateGameStats < ActiveRecord::Migration[5.2]
  def change
    create_table :game_stats do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :pts
      t.integer :reb
      t.integer :ast
      t.integer :stls

      t.timestamps
    end
    add_index :game_stats, [:player_id, :game_id]
  end
end
