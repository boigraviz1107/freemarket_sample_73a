Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :accounts, only: %i(new create)
  resources :items, except: %i(index) do
    resources :orders, only: %i(new create) do
      collection do
        get :card_new, :orderOk
        post :card_create
      end
    end
  end
  resources :brands, only: %i(index show)
  get 'signup/step1', to: 'signup#step1'
  post 'signup/save_step1_to_session', to: 'signup#save_step1_to_session'
  get 'signup/step2', to: 'signup#step2'
  post 'signup/complete_signup', to: 'signup#complete_signup'
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
  get :'category/:category_id/brand/:id', to: 'brands#root_category_brand_item'
end