Rails.application.routes.draw do
  # use_doorkeeper
  # devise_for :users

  #resources :users
  

  resources :games

  post "/games/:id/score" => "games#score"
  delete "/games/:id/reset_point" => "games#reset_point"
  post "/games/:id/end" => "games#end"
  get "leaderboard" => "games#leaderboard"
  
end
