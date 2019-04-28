Rails.application.routes.draw do
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  get 'signup', to: "users#new"

  root 'problems#index'

  resources :problems
  resources :users
  resources :account_activations, only: :edit
end
