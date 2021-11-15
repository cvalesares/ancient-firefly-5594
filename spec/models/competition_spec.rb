require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "Relationships" do
    it { should have_many :competition_teams }
    it { should have_many :teams }
  end
end
