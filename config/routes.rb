Rails.application.routes.draw do
  devise_for :users
  resources :aritcles
  root to: 'articles#index'
end
