Rails.application.routes.draw do
 resources :sessions, only: [:create, :destroy, :new] 
 resources :users
 get '/signup', to: 'users#new'
 get '/login', to: 'sessions#new', as: 'log_in'
 get '/logout', to: 'sessions#destroy', as: 'log_out'
root to: "users#show"
end
