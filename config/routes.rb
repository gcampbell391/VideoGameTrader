Rails.application.routes.draw do

  #Shows all games and single game pages 
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'

  #Sign up page for new user 
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create' 

  
  #Show user page and edit user page
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'

  #Login page for existing users 



  #platform show
  get '/platforms', to: 'platforms#index'
  get '/platforms/:id', to: 'platforms#show'


end
