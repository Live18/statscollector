class Team < ApplicationRecord
  has_many :players

  def is_coach? (user)
    user_association = UserAssociation.find_by(:user_id => user.id, :team_id => self.id)
    is_coach = user_association && user_association.role === 'coach'
  end

  def is_player? (user)
    user_association = UserAssociation.find_by(:user_id => user.id, :team_id => self.id)
    is_coach = user_association && user_association.role === 'player'
  end
end
