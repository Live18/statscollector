Rails.application.routes.draw do
  root 'games#index'
  resources :user_associations
  resources :scoreboards do
    get '/set_starters' => 'scoreboards#new_starters'
    post '/set_starters' => 'scoreboards#create_starters'
    get '/start_game' => 'scoreboards#start_game'
  end
  resources :game_stats
  post '/game_stats/actions/upsert' => 'game_stats#upsert_game_stat'
  resources :games do
    get '/set_starters' => 'games#set_starters'
  end
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
