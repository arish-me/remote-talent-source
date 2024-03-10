# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employees
  post 'additional_information/:id', to: 'additional_information#create', as: 'additional_information'
  put 'additional_information/:id', to: 'additional_information#create', as: 'additional_information_put'
  get 'additional_information/:id', to: 'additional_information#show', as: 'additional_information_new'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/confirmation_sent', to: 'users/confirmations#confirmation_sent', as: 'confirmation_sent'
  end
  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
