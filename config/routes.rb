Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :games

  post "/games/:id/score", :to => "games#score" 
  
end
