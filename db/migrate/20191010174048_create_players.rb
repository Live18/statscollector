class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :number
      t.integer :team_id

      t.timestamps
    end
    add_index :players, :team_id
  end
end
