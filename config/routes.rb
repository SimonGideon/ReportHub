Rails.application.routes.draw do
  devise_for :users

  # Add root to new session
  root to: 'devise/sessions#new'

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  # Other application routes can be defined here
end
