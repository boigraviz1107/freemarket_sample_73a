Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: [:new, :create]
  resources :users, only: [:index, :card, :logout]
  get 'users/card', to: 'users#card'
  get 'users/logout', to: 'users#logout'
  get 'users/card/create', to: 'users#cardCreate'
end
