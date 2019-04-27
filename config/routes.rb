Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'products#index'
  resources :buyers, only: [:show]
  resources :products, only: [:index, :new, :show]
end
