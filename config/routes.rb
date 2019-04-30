Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:new, :show]
  resources :buyers, only: [:show]
  get 'registration' => 'sessions#new'
  post 'create_user' => 'sessions#create_user'
  get 'signup_phone' => 'sessions#signup_phone'
  get 'signup_address' => 'sessions#signup_address'
  post 'create_address' => 'sessions#create_address'
  get 'signup_pay' => 'sessions#signup_pay'
  post 'create' => 'sessions#create'
  get 'complete' => 'sessions#complete'
end
