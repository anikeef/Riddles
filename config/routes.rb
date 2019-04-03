Rails.application.routes.draw do
  get 'users/new'

  root 'riddles#index'

  resources :riddles
  resources :users
end
