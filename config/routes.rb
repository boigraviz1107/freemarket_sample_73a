Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(index) do
    resources :orders, only: %i(new create) do
      collection do
        get :card_new
        post :card_create
      end
    end
  end
  resources :categories, only: %i(show index)
  resources :brands, only: %i(index show)
  resources :categories, only: %i(index show) do
    collection do
      post :root_parent_category, :parents, :children
    end
  end
  resources :users, only: %i(index) do
    collection do
      get :card, :logout
    end
  end
  resources :pays, only: %i(index new create)
  resource :pays, only: %i(destroy)
end