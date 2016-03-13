Rails.application.routes.draw do
  resources :units
  resources :products
  resources :agents
  resources :materials
  resources :orders
  resources :suppliers
  resources :parts
  resources :part_categories
  resources :departments
  devise_for :users
  resources :users
  root to: 'users#index'
end
