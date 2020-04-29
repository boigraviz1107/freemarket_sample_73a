Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(update)
  resources :categories, only: %i(show index)
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show)
  resources :users, only: %i(index)
  get 'users/card', to: 'users#card'
  get 'users/logout', to: 'users#logout'
end