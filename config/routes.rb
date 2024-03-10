# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/confirmation_sent', to: 'users/confirmations#confirmation_sent', as: 'confirmation_sent'
  end
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
