Rails.application.routes.draw do
  resources :users
  resources :transactions
  resources :borrower_reviews
  resources :lender_reviews
  resources :rentals
  resources :lenders
  resources :borrowers
  resources :lender_locations
  resources :borrower_locations
  resources :machine_metal_working_tools
  resources :listings
  resources :gardening_tools
  resources :cutting_abrasive_tools
  resources :cleaningd_tools
  resources :gas_powered_tools
  resources :electric_tools
  resources :hand_tools
  resources :tutorials
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
