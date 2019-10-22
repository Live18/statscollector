class AddRosterReminderEmailSentToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :roster_reminder_email_sent, :boolean, default: :false
  end
end
