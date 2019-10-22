class RemoveUsersFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :users, :boolean
  end
end
