json.extract! scoreboard, :id, :home_team_score, :away_team_score, :home_team_timeouts_remaining, :away_team_timeouts_remining, :period, :home_team_fouls, :away_team_fouls, :posession_arrow, :created_at, :updated_at
json.url scoreboard_url(scoreboard, format: :json)
