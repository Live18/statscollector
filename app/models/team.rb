class Team < ApplicationRecord
  has_many :players
  has_one_through :coach, :user_associations
end
