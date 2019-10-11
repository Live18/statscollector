class CreateUserAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_associations do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
    add_index :user_associations, [:user_id, :team_id]
  end
end
