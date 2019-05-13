Rails.application.routes.draw do
  root 'products#index'
  get 'users/mypage' => 'users#mypage'
  resources :products do
    resources :chats, only: :create
  end
  resources :search, to: 'products#search', only: :index
  resources :buyers, only: [:show, :index]
  resources :users, only: [:new]
  resource :login, to: 'users#login', only: :new
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
end
