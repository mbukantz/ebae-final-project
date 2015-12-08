Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :reviews, only: [:new, :create, :show]
  resources :listings do
    resources :messages, only: [:new, :create, :show]
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


  get '/welcome', to: 'sessions#welcome', as: 'welcome'

  get '/analytics', to: 'analytics#index', as: 'analytics'

  root to: "home#index"

end
