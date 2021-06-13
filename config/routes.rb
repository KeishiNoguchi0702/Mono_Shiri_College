Rails.application.routes.draw do
  devise_for :users
  resources :aritcles
  root 'articles#index'
end
