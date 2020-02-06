Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  resources :contents, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:edit, :update]
end
