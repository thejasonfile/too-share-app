Rails.application.routes.draw do
  resources :delete_listing_id_from_tools
  resources :add_lender_id_from_tools
  resources :remove_listing_id_from_tools
  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions
  resources :transactions
  resources :reviews
  resources :rentals
  resources :listings
  resources :tools
  post '/products/add', to: 'products#add'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
