class Player < ApplicationRecord
  belongs_to :teams
  has_many :game_stats
end
