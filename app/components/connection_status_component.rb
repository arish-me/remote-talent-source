# frozen_string_literal: true

class ConnectionStatusComponent < ApplicationComponent
  attr_reader :connection

  def initialize(connection:)
    @connection = connection
  end

  def status
    connection.status
  end

  def request_status
    case status

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

    when 'pending'
      'text-bg-warning'
    when 'declined'
      'text-bg-danger'
    when 'accepted'
      'text-bg-success'
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

  def accepted?
    status == 'accepted'
  end

  private

  def company_path
    {
      path: company_connection_requests_path(company, employee_id: employee.id),
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
