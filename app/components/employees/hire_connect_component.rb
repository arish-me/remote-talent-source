# frozen_string_literal: true

module Employees
  class HireConnectComponent < ApplicationComponent
    def initialize(employee:, company:)
      @employee = employee
      @company = company
    end

    def url
      company ? company_path : fallback_path
    end

    def text
      company ? request_status : 'Hire Me'
    end

    def request_status
      case status

      when 'open'
        'Connect'
      when 'pending'
        'Pending'
      when 'declined'
        'Declined'
      when 'accepted'
        'Accepted'
      end
    end

    def classes
      case status

      when 'open'
        'btn-dark'
      when 'pending'
        'btn-warning'
      when 'declined'
        'btn-danger'
      when 'accepted'
        'btn-success'
      end
    end

    def icon
      case status

      when 'open'
        'fa-solid fa-plus'
      when 'pending'
        'fa-regular fa-clock'
      when 'declined'
        'btn-danger'
      when 'accepted'
        'btn-success'
      end
    end

    def status
      connection_request&.status || 'open'
    end

    def connection_request
      return unless company

      company.connection_requests.find_by(employee_id: employee.id)
    end

    private

    def company_path
      {
        path: connection_path(company, employee_id: employee.id),
        method: :post
      }
    end

    def fallback_path
      {
        path: new_user_session_path,
        method: :get
      }
    end

    attr_reader :employee, :company
  end
end
