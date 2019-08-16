Rails.application.routes.draw do
  resources :fantasy_leagues
  resources :players
  resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :fantasy_leagues do 
    resources :players
  end 
  
  resources :users do 
    resources :fantasy_leagues 
  end 
end
