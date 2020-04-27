Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: [:new, :create]
end
