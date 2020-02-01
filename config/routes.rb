Rails.application.routes.draw do
  root 'contents#index'
  resources :contents, only: [:new, :create]
end
