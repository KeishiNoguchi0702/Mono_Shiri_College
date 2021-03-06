Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :retirements, only: [:show]
  resources :articles
  resources :top, only: [:index]
end
