Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :buyers, only: [:show]
  resources :users, only: [:new]
  resource :login, to: 'users#login', only: :new
  resource :registration, controller: 'sessions', only: [:new, :create]
  resource :create_user, to: 'sessions#create_user', only: :create
  resource :signup_phone, to: 'sessions#signup_phone', only: :new
  resource :signup_address, to: 'sessions#signup_address', only: :new
  resource :create_address, to: 'sessions#create_address', only: :create
  resource :signup_pay, to: 'sessions#signup_pay', only: :new
  resource :complete, to: 'sessions#complete', only: :new
  resource :logout, to: 'sessions#logout', only: :new
  resource :login, to: 'sessions#login', only: :create
  resource :likes, to: 'likes#create', path: 'likes/:product_id/create', only: :create, as: 'like'
  resource :likes, to: 'likes#destroy', path: 'likes/:product_id/destroy', only: :destroy, as: 'unlike'
end
