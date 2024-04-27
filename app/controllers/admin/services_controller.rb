# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    def index
      @hash = {
        users: User.count,
        employees: Employee.count,
        companies: Company.count,
        demployees: 0,
        dcompanies: 0
      }
    end

    def create
      service_name = params[:service]

      case service_name
      when 'employees'
        Admin::EmployeeService.new(5).call
      when 'companies'
        Admin::CompanyService.new(5).call
      when 'demployees'
        Employee.destroy_all
      when 'dcompanies'
        Company.destroy_all
      end
      redirect_to admin_services_path
    end
  end
end
