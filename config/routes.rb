Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suppliers, only: %i[index create]
  resources :batches, only: %i[index create]
  resources :products, only: %i[index create edit update]
  get 'buy', to: 'pages#buy', as: 'buy'
  get 'quality', to: 'pages#quality', as: 'quality'
  get 'sale', to: 'pages#sale', as: 'sale'
  get 'transport', to: 'pages#transport', as: 'transport'
end
