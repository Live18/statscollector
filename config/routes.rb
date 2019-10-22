Rails.application.routes.draw do
  root 'games#index'
  resources :user_associations
  resources :scoreboards
  resources :game_stats
  resources :games
  devise_for :users
  resources :players
  resources :teams do 
    get '/invite/coach' => 'teams#new_coach'
    post '/invite/coach' => 'teams#create_coach'
    get '/invite/player' => 'teams#new_player'
    post '/invite/player' => 'teams#create_player'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
