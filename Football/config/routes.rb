Rails.application.routes.draw do
  resources :fantasy_leagues
  resources :players
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
