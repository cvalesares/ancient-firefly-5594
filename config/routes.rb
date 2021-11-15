Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/teams", to: "teams#index"

  get "/competitions/:competition_id", to: "competitions#show"

  get "/competitions/:competition_id/teams", to: "competition_teams#new"
end
