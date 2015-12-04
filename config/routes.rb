Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :reviews
  resources :listings do
    resources :sales
  end
  resources :categories 

  resources :search, only: [:index]
  resources :bids, only: [:create]
  resources :dashboard, only: [:index]
  resources :watchlists, only: [:create, :destroy]
  get '/user/:id/feedback', to: 'users#feedback'
  get 'user/:id/givefeedback', to: 'users#givefeedback'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new', as: 'log_in'
  get '/logout', to: 'sessions#destroy', as: 'log_out'
  root to: "home#index"

end
