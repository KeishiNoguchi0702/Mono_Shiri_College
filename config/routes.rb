Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :retirements, only: [:show]
  resources :articles, only: [:index, :new]
end
