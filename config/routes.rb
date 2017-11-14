Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
