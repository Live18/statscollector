class AddRosterEmailSentToScoreboard < ActiveRecord::Migration[5.2]
  def change
    add_column :scoreboards, :roster_email_sent, :boolean, default: false
  end
end
