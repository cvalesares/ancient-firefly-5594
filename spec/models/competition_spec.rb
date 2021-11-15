require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "Relationships" do
    it { should have_many :competition_teams }
    it { should have_many :teams }
  end

  describe "methods" do
    describe "::average_player_age" do
      it "can find the average age of all players" do
        competition1 = Competition.create!(name: "Stanely Cup", location: "Canada", sport: "Hockey")
        team1 = competition1.teams.create!(hometown: "Tampa", nickname: "Bolts")
        team2 = competition1.teams.create!(hometown: "Raleigh", nickname: "Canes")
        player1 = team1.players.create!(name: "Brayden Point", age: 26)
        player2 = team1.players.create!(name: "Stephen Stamkos", age: 36)
        player3 = team2.players.create!(name: "Sebastian Aho", age: 28)

        expect(Competition.average_player_age).to eq(30)
      end
    end
  end
end
