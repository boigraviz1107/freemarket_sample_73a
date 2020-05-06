Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(index) do
    resources :orders, only: %i(new create) do
      collection do
        get :orderOk
      end
    end
  end
  resources :categories, only: %i(show index)
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show)
  resources :users, only: %i(index)
  resources :pays, only: %i(index new create destroy)
  get 'users/card', to: 'users#card'
  get 'users/logout', to: 'users#logout'
  post 'category/root_parent', to: 'categories#root_parent_category'
  post 'category/parents', to: 'categories#parents'
  post 'category/children', to: 'categories#children'
  get 'order/cardRegist', to: 'orders#cardRegist'
  post 'order/cardCreate', to: 'orders#cardCreate'
  # get 'order/orderOk', to: 'orders#orderOk'
end