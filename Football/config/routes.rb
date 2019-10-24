Rails.application.routes.draw do
  resources :leagues
  resources :teams
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  
  get 'user_leagues/most' => 'leagues#max_league'
  get 'user_leagues/cost' => 'leagues#cost'
  get 'user_leagues/people_in_league' => 'leagues#people_in_league'
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 
  

  # get '/users/:id/leagues/cost', to: 'leagues#cost'
  # get '/users/:id/leagues/people_in_league', to: 'leagues#people_in_league'
  

  
    resources :users do
      resources :leagues do  
    end 

    resources :leagues do
      resources :teams 
    end  
    
    resources :footballs
    get '/auth/google_oauth2/callback' => 'footballs#create'
    get 'auth/failure' => redirect('/')

  end 
end 
