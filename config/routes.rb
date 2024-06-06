Rails.application.routes.draw do
  resources :reports
  devise_for :users
  # add root path
  root to: 'home#index'

  # # # Add root to new session
  # / to: 'devise/sessions#new'

  # authenticated :user do
  #   root to: 'home#index', as: :authenticated_root
  # end

  # unauthenticated do
  #   root to: 'devise/sessions#new', as: :unauthenticated_root
  # end

  # Other application routes can be defined here
end
