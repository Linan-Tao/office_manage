Rails.application.routes.draw do
  get 'visitors/index'

  resources :suppliers
  resources :parts
  resources :part_categories
  resources :departments
  devise_for :users
  resources :users
  resources :roles
  root to: 'visitors#index'
end
