# frozen_string_literal: true

Rails.application.routes.draw do
  resources :hiring
  resources :talent_jobs
  resources :additional_informations
  resources :employees do
    resources :specialities
  end

  resources :notifications, only: %i[index show] do
    collection do
      post :mark_all_as_read
    end
  end

  resources :companies

  resources :connections

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

  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
