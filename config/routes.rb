Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  #devise_for :users, :controllers => {
  #  :sessions => "users/sessions",
  #  :registrations => "users/registrations"
  #}
  resources :users, only: [:show]
  resources :aritcles
end
