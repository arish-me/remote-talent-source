# frozen_string_literal: true

Rails.application.routes.draw do
  resources :companies
  resources :employees do
    resources :specialities
  end

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
  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
