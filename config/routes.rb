Rails.application.routes.draw do
  get 'signup', to: "users#new"

  root 'riddles#index'

  resources :riddles
  resources :users
end
