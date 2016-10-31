Rails.application.routes.draw do
  resources :checkouts
  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  get '/listings/analytics', to: 'listings#analytics'
  resources :users
  resources :sessions
  resources :reviews
  resources :rentals
  resources :listings
  resources :tools
  post '/checkouts/add', to: 'checkouts#add'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
