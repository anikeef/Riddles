Rails.application.routes.draw do
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'signup', to: "users#new"

  root 'riddles#index'

  resources :riddles
  resources :users
end
