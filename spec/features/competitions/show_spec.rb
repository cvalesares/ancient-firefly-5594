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

# User Story 3 - Register a Team
#
# As a user
# When I visit a competition's show page
# Then I see a text field to enter a team name
# When I fill in this field with the name of an existing team
# And I click the submit button
# Then the team with the name that I submitted is associated with this competition
# And I am redirected back to the competition's show page
# And I see that the team is now listed among the other teams in the competition
#
# (Note: you do not need to handle any sad paths, for example if the name entered does not match an existing team)
# ```
