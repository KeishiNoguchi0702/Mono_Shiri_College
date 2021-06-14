Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :aritcles
  root 'articles#index'
end
