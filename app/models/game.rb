class Game < ApplicationRecord
  has_one :scoreboard
  validate :unique_teams
  
  def unique_teams
    if home_team === away_team
      errors.add(:message, "Home team and Away team cannot be the same")
    end
  end
end
