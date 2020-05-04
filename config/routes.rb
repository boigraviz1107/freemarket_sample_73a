Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(index) do
    resources :orders, only: %i(new create)
  end
  resources :categories, only: %i(show index)
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show)
  resources :users, only: %i(index)
  resources :pays, only: %i(index new create destroy)
  get 'users/card', to: 'users#card'
  get 'users/logout', to: 'users#logout'
  post 'item/category', to: 'items#category'
  post 'item/parent_category', to: 'items#parent_category'
end