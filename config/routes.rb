Rails.application.routes.draw do
  get 'countries/show'
  get 'user/show'

  get 'user/edit'

  get 'user/update'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :countries, only: [:show]

  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  get 'destination_selector', to: 'pages#dashboard'
  resources :destinations, only: [:create]
  resources :countries, only: [:show]

  get 'destination_select', to: 'pages#destination_select'

end
