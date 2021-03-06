Rails.application.routes.draw do
  resources :leagues
  resources :teams
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  
  get 'user_leagues/most' => 'leagues#max_league'
  
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 

  
  
    resources :users do
      resources :leagues do 
        resources :teams 
    end 

    resources :leagues do
      resources :teams 
    end  
    
    resources :footballs
    get '/user/auth/google_oauth2/callback' => 'footballs#create'
    get 'auth/failure' => redirect('/')

  end 
end 
