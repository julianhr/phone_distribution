Rails.application.routes.draw do
  root to: "page#root"

  namespace :api do
    get 'users/show'
    get 'zip_code/:code/random_numbers', to: 'zip_code#random_numbers'
    put 'phone_number/assign_specific'
    patch 'phone_number/assign_specific'
    get 'phone_number/:number/availability', to: 'phone_number#availability'
  end

  resources :zip_code_area_codes
  resources :phone_numbers
  resources :users
  resources :area_codes
  resources :zip_codes
  resources :cities
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
