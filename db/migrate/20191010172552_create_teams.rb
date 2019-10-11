class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :mascot
      t.integer :coach_id

      t.timestamps
    end
    add_index :teams, :coach_id
  end
end
