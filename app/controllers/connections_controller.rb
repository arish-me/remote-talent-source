# frozen_string_literal: true

# app/controllers/connection_requests_controller.rb
class ConnectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resource!

  def index
    @connection_requests = if current_user.employee
                             current_user.employee.connection_requests.includes(:employee, :company)
                           else
                             current_user.company.connection_requests.includes(:employee, :company)
                           end
  end

  def new; end

  def create
    employee = Employee.find(params[:employee_id])
    request = @company.connection_requests.new(employee:, status: 'pending')
    if request.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('status_frame', partial: 'employees/hire_connect',
                                                                    locals: { company: @company, employee: }, status: :created)
        end
        format.html { redirect_to employee_path(request.employee), notice: 'Connection request updated.' }
      end
    else
      redirect_to public_profile_path(request.employee), alert: 'Failed to update request.'
    end
  end

  def update
    request = @resource.connection_requests.find(params[:id])
    return unless request.update(connection_request_params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('actions_frame', partial: 'connection_requests/actions',
                                                                   locals: { connection_request: request }, status: :created)
      end
      format.html { redirect_to connection_request_path, notice: 'Connection request updated.' }
    end
  end

  private

  def set_resource!
    @resource = if current_user.company?
                  current_user.company
                else
                  current_user.employee
                end
  end

  def connection_request_params
    params.require(:connection_request).permit(:status)
  end
end
