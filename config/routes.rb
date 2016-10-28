Rails.application.routes.draw do
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
