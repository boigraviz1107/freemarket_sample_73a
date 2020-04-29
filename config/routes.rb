Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(edit update)
  resources :categories, only: %i(show index)
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show)
end
