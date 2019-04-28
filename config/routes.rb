Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:new]
  resources :buyers, only: [:show]
  get 'users/address' => 'users#address'
  get 'users/last_signup' => 'users#last_signup'
end
