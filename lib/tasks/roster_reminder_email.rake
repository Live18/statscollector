require 'rake'
require 'date'
require "#{Rails.root}/config/environment"

namespace :roster_reminder_email do
  desc 'send roster reminder email'
  task send_roster_reminder_email: :environment do
    @upcoming_games = Game.where(:date => Date.today..1.day.from_now, :roster_reminder_email_sent => false)
    @upcoming_games.map { |game|   
      @relevant_coaches = UserAssociation.where(:team_id => [game.home_team, game.away_team], :role => "coach")
      @relevant_coaches.map { |coach_association|
        UserMailer.with(team: coach_association.team_id, user: coach_association.user_id, game: game.id).roster_reminder_email.deliver_now
      }
      game.roster_reminder_email_sent = true
      game.save 
    }
  end
end

# Is there a game within 24 hrs? If so, send email to coach and set roster reminder to true.