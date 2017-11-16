Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :destinations, only: [:create, :destroy, :update]
  resources :countries, only: [:show]

  get 'destination_select', to: 'pages#destination_select'
  get 'map', to: 'pages#map'

end
