Rails.application.routes.draw do
  resources :leagues
  resources :players
  resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy' 
  
  resources :users do 
    resources :leagues do 
      resources :players 
    end
  end 
end
