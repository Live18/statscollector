json.extract! game, :id, :date, :home_team, :away_team, :scoreboard_id, :created_at, :updated_at
json.url game_url(game, format: :json)
