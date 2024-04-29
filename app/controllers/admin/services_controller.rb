# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    def index
      @hash = {
        users: User.count,
        employees: Employee.count,
        demployees: 0,
        companies: Company.count,
        dcompanies: 0,
        jobs: Job.count,
        djobs: 0,
        currencies: Currency.count,
        dcurrencies: 0,
        countries: Country.count,
        dcountry: 0
      }
    end

    def create
      service_name = params[:service]

      case service_name
      when 'employees'
        Admin::EmployeeService.new(5).call
      when 'companies'
        Admin::CompanyService.new(5).call
      when 'jobs'
        Admin::JobService.new(1).call
      when 'currencies'
        system('bundle exec rake import:currencies')
      when 'countries'
        system('bundle exec rake import:countries')
      when 'dcurrencies'
        Currency.destroy_all
      when 'dcountry'
        Country.destroy_all
      when 'djobs'
        Job.destroy_all
      when 'demployees'
        Employee.destroy_all
      when 'dcompanies'
        Company.destroy_all
      end
      redirect_to admin_services_path
    end
  end
end
