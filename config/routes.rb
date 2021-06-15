Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :users, only: [:show, :destroy]
  resources :retirements, only: [:show]
  resources :aritcles
end
