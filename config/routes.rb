Rails.application.routes.draw do
  root 'products#index'
  resources :products do
    resources :chats, only: :create
  end
  resources :search, to: 'products#search', only: :index
  resources :buyers, only: [:show, :index]
  resources :users, only: [:new]
  resource :login, to: 'users#login', only: :new
  resource :mypage, to: 'users#mypage', path: 'users/:id', only: :show
  resource :signout, to: 'users#signout', path: 'users/:id/signout', only: :show
  resource :update_user, to: 'users#update_user', path: 'users/:id/update_user', only: :update
  resource :edit_user, to: 'users#edit_user', path: 'users/:id/edit_user', only: :edit
  resource :update_profile, to: 'users#update_profile', path: 'users/:id/update_profile', only: :update
  resource :edit_profile, to: 'users#edit_profile', path: 'users/:id/edit_profile', only: :edit
  resource :registration, controller: 'sessions', only: [:new, :create]
  resource :create_user, to: 'sessions#create_user', only: :create
  resource :signup_phone, to: 'sessions#signup_phone', only: :new
  resource :signup_address, to: 'sessions#signup_address', only: :new
  resource :create_address, to: 'sessions#create_address', only: :create
  resource :signup_pay, to: 'sessions#signup_pay', only: :new
  resource :credits, only: [:create]
  resource :complete, to: 'sessions#complete', only: :new
  resource :logout, to: 'sessions#logout', only: :new
  resource :login, to: 'sessions#login', only: :create
  resource :pay, to: 'credits#pay', only: :create
  resource :sns, to: 'sessions#sns', path: 'auth/:provider/callback', only: :show
  resource :category, to: 'products#category', only: :show
  resource :list, to: 'products#list', path: 'list/:id', only: :show
  resource :brand, to: 'products#brand', path: 'brand/:id', only: :show
  resource :stop_shipping, to: 'products#stop_shipping', path: 'stop_shipping/:id', only: :update
  resource :shipping_again, to: 'products#shipping_again', path: 'shipping_again/:id', only: :update
end
