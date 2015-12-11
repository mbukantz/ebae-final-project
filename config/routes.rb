Rails.application.routes.draw do
  resources :advanced_searches
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :reviews, only: [:new, :create, :show]
  resources :listings do
    resources :messages, only: [:new, :create, :show, :update]
    resources :sales do
      resources :reviews
    end
  end

  # resources :conversations do
  #   resources :messages, only: [:show, :new, :create]
  # end
  
  resources :categories
  resources :charges, only: [:create]
  resources :messages, only: [:index]
  patch 'messages/update_multiple', :to => 'messages#update_multiple'

  resources :search, only: [:index]
  resources :bids, only: [:create]
  resources :dashboard, only: [:index]
  resources :watchlists, only: [:create, :destroy]
  get '/user/:id/feedback', to: 'users#feedback'
  get 'user/:id/givefeedback', to: 'users#givefeedback'
  get '/users/:id/reviews', to: 'reviews#summary', as: 'reviews_summary'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new', as: 'log_in'
  get '/logout', to: 'sessions#destroy', as: 'log_out'
  root to: "home#index"
  get '/analytics', to: 'analytics#index', as: 'analytics'
  namespace :api, :defaults => { :format => 'json' } do 
    resources :categories
  end
end
