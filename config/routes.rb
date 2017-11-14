Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :destinations, only: [:create]
  resources :countries, only: [:show]

  get 'destination_selector', to: 'pages#dashboard'
end
