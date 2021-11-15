class CompetitionTeamsController < ApplicationController
  def new
    competition = Competition.find(params[:competition_id])
    competition.teams.create!(team_params)

    redirect_to "/competitions/#{competition.id}"
  end

  private
    def team_params
      params.permit(:hometown, :nickname)
    end
end
