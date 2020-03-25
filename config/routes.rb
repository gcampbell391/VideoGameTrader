Rails.application.routes.draw do

  #Shows all games and single game pages 
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'

  resources :users do 
    resources :games
    resources :platforms
  end
  #Welcome
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  #Show all users
  get 'users/all', to: 'users#index'

  #Sign up page for new user 
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create' 

  
  #Show user page and edit user page
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id/destroy', to: 'users#destroy' 

  #Add game to user 
  get "/:id/addgame", to: 'games#new'
  post "/:id/gameadded", to: 'games#create'

  #platform show
  get '/platforms', to: 'platforms#index'
  get '/platforms/:id', to: 'platforms#show'
  get "/:id/addplatform", to: 'platforms#new'
  post "/:id/platformadded", to: 'platforms#create'

  #Delete a user platform
  get "/:id/removeplatform", to: 'platforms#edit'
  post "/deleteplatform", to: 'platforms#delete'

  #Delete a user game
  get "/:id/removegame", to: 'games#edit'
  post "/deletegame", to: 'games#delete'

  #Allows a User to logout 
  get "/logout", to: 'users#logout'

  #Trade game
  get "/tradegame/:title/:id", to: 'users#trade'
  post "/finalizetrade", to: 'users#complete_trade'
end
