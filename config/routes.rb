Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:new, :show]
  resources :buyers, only: [:show]
  resources :registration, controller: 'sessions', except: [:index, :update, :destroy, :show, :edit] do
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
