Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :popular, only: :index, module: :prototypes, path: 'prototypes/popular'
  resources :users, only: [:index, :edit, :show, :update]

  resources :prototypes do
    scope module: :prototypes do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
