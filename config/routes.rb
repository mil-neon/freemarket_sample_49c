Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:new, :show]
  resources :buyers, only: [:show]
  resources :registration, controller: 'sessions', only: [:create_user, :signup_phone, :signup_address, :create_address, :signup_pay, :signup_pay, :complete, :create, :new] do
    collection do
      post 'create_user'
      get 'signup_phone'
      get 'signup_address'
      post 'create_address'
      get 'signup_pay'
      get 'complete'
    end
  end
end
