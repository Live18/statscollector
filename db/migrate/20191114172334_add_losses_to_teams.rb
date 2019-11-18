class AddLossesToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :losses, :integer, :default => 0
  end
end
