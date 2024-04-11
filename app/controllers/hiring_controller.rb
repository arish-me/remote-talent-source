# frozen_string_literal: true

# controllers/hiring_controller.rb
class HiringController < ApplicationController
  def index
    @query = EmployeeQuery.new(query_params.merge(user: current_user))
  end

  def show; end

  private

  def query_params
    permitted = policy(%i[employees query]).permitted_attributes
    params.permit(permitted)
  end
end
