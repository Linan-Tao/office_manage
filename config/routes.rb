Rails.application.routes.draw do

  resources :produces
  resources :produce_tasks
  resources :purchases
  resources :offers
  resources :order_parts
  resources :order_units
  resources :products
  resources :agents
  resources :materials
  resources :orders

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
