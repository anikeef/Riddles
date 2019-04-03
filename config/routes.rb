Rails.application.routes.draw do
  root 'riddles#index'

  resources :riddles
  resources :users
end
