Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items do
    resources :images
  end
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show)
end
