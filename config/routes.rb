Rails.application.routes.draw do
  resources :departments
  devise_for :users
  resources :users
  root to: 'users#index'
end
