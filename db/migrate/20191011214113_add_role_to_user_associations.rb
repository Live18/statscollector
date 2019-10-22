class AddRoleToUserAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_associations, :role, :string
  end
end
