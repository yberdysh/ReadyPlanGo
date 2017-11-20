Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }



  # authenticated :user do
  #   root to: 'users#show#id'
  # end

  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :destinations, only: [:create, :destroy, :update]
  resources :countries, only: [:show] do
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
  end


  get 'destination_select', to: 'pages#destination_select'
  get 'map', to: 'pages#map'

end
