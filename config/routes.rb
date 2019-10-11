Rails.application.routes.draw do
  root 'games#index'
  resources :user_associations
  resources :scoreboards
  resources :game_stats
  resources :games
  devise_for :users
  resources :players
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
