Rails.application.routes.draw do
  devise_for :users
  #registrations: 'users/registrations'
  resources :users, only: [:show]
  resources :aritcles
  root 'articles#index'
end
