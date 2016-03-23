Rails.application.routes.draw do

  resources :staffs
  resources :produces
  resources :produce_tasks
  resources :mix_tasks
  resources :materials
  resources :material_types
  resources :material_categories
  resources :purchases
  resources :products
  resources :agents
  resources :orders do
    resources :order_units do
      collection do
        post :import
      end
    end
    resources :order_parts do
      collection do
        post :batch_create
      end
    end
    resources :offers
  end

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
