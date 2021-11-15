class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def self.average_player_age
    Team.joins(:players).average(:age)
  end
end
