# frozen_string_literal: true

Rails.application.routes.draw do
  authenticate :user, lambda(&:admin?) do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :hiring
  resources :talent_jobs
  resources :additional_informations
  resources :employees do
    resources :messages, only: %i[new create], controller: :cold_messages
    resources :specialities
    resources :messages, except: %i[index]
  end

  resources :notifications, only: %i[index show] do
    collection do
      post :mark_all_as_read
    end
  end

  resources :companies

  resources :connections

  # resources :conversations do
  #   resources :messages, except: %i[index]
  # end

  resources :conversations, only: %i[index show] do
    resources :messages, only: :create
  end

  resources :jobs do
    post 'change_status', on: :member
  end

  post 'send_notification/:id', to: 'employees#send_notification', as: 'send_notification'

  resources :skills
  get 'talentsource/:id', to: 'employees#public_profile', as: 'public_profile'
  get 'additional_information/:id/company', to: 'additional_information#company'
  get 'additional_information/:id/employee', to: 'additional_information#employee'
  post 'additional_information/:id/employee', to: 'additional_information#employee', as: 'employee_tab'
  post 'additional_information/:id/company', to: 'additional_information#company', as: 'company_tab'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/confirmation_sent', to: 'users/confirmations#confirmation_sent', as: 'confirmation_sent'
  end

  # admin
  namespace :admin do
    resource :impersonate, only: %i[create destroy]
    resources :users, only: [:index]
    resources :categories
    resources :primary_roles
    resources :skills
    resources :services
  end

  get 'about', to: 'about#index', as: 'about'
  get 'terms_services', to: 'about#terms_services', as: 'terms_services'
  get 'privacy_policy', to: 'about#privacy_policy', as: 'privacy_policy'

  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
