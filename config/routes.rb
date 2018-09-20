# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  get 'saved_for_later', to: 'products#saved_for_later'
  delete 'remove_from_saved', to: 'products#remove_from_saved'
  resources :order_items
  resources :orders
   get 'history', to: 'orders#history'
  resources :charges
  resource :cart, only: %i[show destroy], path: :checkout
  resources :reviews
end
