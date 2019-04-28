Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'products#index'
  resources :users, only: [:new]
  resources :products, only: [:index]
  resources :buyers, only: [:show]
  resources :products, only: [:index, :show]
end
