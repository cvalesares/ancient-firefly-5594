require 'rails_helper'

RSpec.describe "Team Index Page" do
  before :each do
    @team1 = Team.create!(hometown: "Tampa", nickname: "Bolts")
    @team2 = Team.create!(hometown: "Tampa", nickname: "Bucs")
    @player1 = @team2.players.create!(name: "Tom Brady", age: 45)
    @player2 = @team2.players.create!(name: "Mike Evans", age: 32)
    @player3 = @team1.players.create!(name: "Brayden Point", age: 25)
    @player4 = @team1.players.create!(name: "Stephen Stamkos", age: 36)
  end

  it "shows the teams and their attributes" do
    visit "/teams"

    within "#id-#{@team1.id}" do
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@player3.name)
      expect(page).to have_content(@player3.age)
      expect(page).to have_content(@player4.name)
      expect(page).to have_content(@player4.age)
    end

    within "#id-#{@team2.id}" do
      expect(page).to have_content(@team2.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@player1.name)
      expect(page).to have_content(@player1.age)
      expect(page).to have_content(@player2.name)
      expect(page).to have_content(@player2.age)
    end
  end
end
