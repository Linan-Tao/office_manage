Rails.application.routes.draw do
  resources :suppliers
  resources :parts
  resources :part_categories
  resources :departments
  devise_for :users
  resources :users
  root to: 'users#index'
end
