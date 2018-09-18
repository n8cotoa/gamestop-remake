Rails.application.routes.draw do
  root :to => 'products#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :order_items
  resources :orders
  resource :cart, only: [:show, :destroy]
end
