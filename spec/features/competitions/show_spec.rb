require 'rails_helper'

RSpec.describe "Competition Show Page" do
  before :each do
    @competition1 = Competition.create!(name: "Stanely Cup", location: "Canada", sport: "Hockey")
    @team1 = @competition1.teams.create!(hometown: "Tampa", nickname: "Bolts")
    @team2 = @competition1.teams.create!(hometown: "Raleigh", nickname: "Canes")
    @team3 = Team.create!(hometown: "Denver", nickname: "Aves")
    @player1 = @team1.players.create!(name: "Brayden Point", age: 26)
    @player2 = @team1.players.create!(name: "Stephen Stamkos", age: 36)
    @player3 = @team2.players.create!(name: "Sebastian Aho", age: 28)
  end

  it "shows a competition and its attributes" do
    visit "/competitions/#{@competition1.id}"

    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition1.location)
    expect(page).to have_content(@competition1.sport)
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content("Average player age: 30.0")
  end

  it "can register a new team" do
    visit "/competitions/#{@competition1.id}"

    expect(page).to_not have_content(@team3.nickname)

    fill_in("nickname", with: "Aves")
    click_button "Submit"
    expect(current_path).to eq("/competitions/#{@competition1.id}")

    expect(page).to have_content(@team3.nickname)
  end
end
