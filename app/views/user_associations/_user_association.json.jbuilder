json.extract! user_association, :id, :team_id, :user_id, :created_at, :updated_at
json.url user_association_url(user_association, format: :json)
