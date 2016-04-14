Rails.application.routes.draw do

  resources :order_unions do
    resources :offers
  end
  resources :delivery_plans
  resources :instalers
  resources :drivers
  resources :logistic_providers
  resources :estates
  resources :out_storages
  resources :item_storages
  resources :month_salaries
  resources :flow_bills
  resources :application_funds
  resources :staffs
  resources :produces

  resources :produce_tasks do
    collection do 
      get :not_open
    end
  end
  resources :mix_tasks
  resources :materials
  resources :material_types
  resources :material_categories
  resources :purchases do
    member do
      get :checked
      get :check_failed
    end
    collection do
      get :not_check
    end
  end
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
    resources :order_bills
    member do 
      get :open_order
      get :download
    end
  end
  get "order_bills/not_check"
  get "order_bills/checked"


  get 'visitors/index'

  resources :suppliers
  resources :parts
  resources :part_categories
  resources :departments
  devise_for :users
  resources :users do
    member do
      get :approved
    end
  end
  resources :roles
  root to: 'visitors#index'
end
