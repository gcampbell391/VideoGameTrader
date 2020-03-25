Rails.application.routes.draw do

resources :users do 
  resources :games
  resources :platforms
end
resources :platforms
resources :games do 
  resources :user_video_games
end 
#Sessions Routes
get 'welcome', to: "sessions#welcome"
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
get "/logout", to: 'users#logout'

#Remove User Platform
post "/deleteplatform", to: 'platforms#delete'

#Remove User Game 
post "/deletegame", to: 'games#delete'

#Routes for Trading
get "/tradegame/:title/:id", to: 'users#trade'
post "/finalizetrade", to: 'users#complete_trade'

#Route for adding User game
post "/:id/gameadded", to: 'games#create'

end 