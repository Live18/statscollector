json.extract! game_stat, :id, :game_id, :player_id, :pts, :reb, :ast, :stls, :created_at, :updated_at
json.url game_stat_url(game_stat, format: :json)
