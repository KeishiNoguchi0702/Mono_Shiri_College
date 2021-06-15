Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :users, only: [:show]
  resources :aritcles
  resources :retirements, only: [:show, :create]
end
