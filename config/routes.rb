Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :reviews, only: [:new, :create, :show]
  resources :listings do
    resources :messages, only: [:new]
    resources :sales do
      resources :reviews
    end
  end

  resources :messages

  # NOTES:
  # should the initial route from listings#show be conversations/new? 
  # Can the user just interact with a conversations resource, and the 
  # message resource just exist for the DB?
  # i.e. the form creates a conversation and a message, but the 
  # user is only aware of the conversations path(s)
  # Think about: Why would you ever display a message without a conversation?
  # (make a conversation controller)
  # People think of messages in a larger context, not as individual messages.
  # The view and the model don't have to mirror one another (The view doesn't have to know about messages. It can just handle conversations.)
  # Note: You can pass through the listing this way, no matter the route/controller action: <%= link_to "Ask seller a question about this item", {:controller => "conversations", :action => "new", :listing_id => @listing.id} %>

  resources :conversations do
    resources :messages, only: [:show, :new, :create]
  end
  
  resources :categories
  resources :charges, only: [:create]

  resources :search, only: [:index]
  resources :bids, only: [:create]
  resources :dashboard, only: [:index]
  resources :watchlists, only: [:create, :destroy]
  

  get '/user/:id/feedback', to: 'users#feedback'
  get '/user/:id/givefeedback', to: 'users#givefeedback'
  get '/users/:id/reviews', to: 'reviews#summary', as: 'reviews_summary'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new', as: 'log_in'
  get '/logout', to: 'sessions#destroy', as: 'log_out'
  root to: "home#index"

end
