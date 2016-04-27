Rails.application.routes.draw do
  root 'prototypes#index'
  resources :protospaces, only: [:new, :show]
end
