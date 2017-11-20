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
<<<<<<< HEAD
  resources :countries, only: [:show, :index]
=======
  resources :countries, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

>>>>>>> 88d9231dd1b761c34ba5fb9a14d09d45a934897d

  get 'destination_select', to: 'pages#destination_select'
  get 'map', to: 'pages#map'

end
