Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  

  resources :games

  post "/games/:id/score" => "games#score"
  delete "/games/:id/reset_point" => "games#reset_point"
  post "/games/:id/end" => "games#end"
  get "leaderboard" => "games#leaderboard"
  
end
