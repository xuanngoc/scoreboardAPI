Rails.application.routes.draw do
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  # use_doorkeeper
  # devise_for :users

  #resources :users
  
  devise_for :users, controllers: {
    registrations: 'api/v1/users/registrations',
    passwords: 'api/v1/users/passwords'
  }, skip: [:sessions]

  resources :games

  post "/games/:id/score" => "games#score"
  delete "/games/:id/reset_point" => "games#reset_point"
  post "/games/:id/end" => "games#end"
  get "leaderboard" => "games#leaderboard"
  
end
