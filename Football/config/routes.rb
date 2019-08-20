Rails.application.routes.draw do
  resources :leagues
  resources :teams
  resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy' 
  
  
    resources :leagues do 
      resources :teams 
    end 
end
