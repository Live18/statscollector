class Scoreboard < ApplicationRecord
  belongs_to :game
  validate :check_current_players

  def check_current_players
    if !self.home_team_current_players.nil?
      home_players = JSON.parse(self.home_team_current_players)
      passes = home_players.length == 5
      unless home_players.length == 5
        errors.add(:home_team_current_players, "Home team must have 5 players")
      end
    end
    if !self.away_team_current_players.nil?
      away_players = JSON.parse(self.away_team_current_players)
      passes = away_players.length == 5
      unless away_players.length == 5
        errors.add(:away_team_current_players, "Away team must have 5 players")
      end
    end
  end


end
