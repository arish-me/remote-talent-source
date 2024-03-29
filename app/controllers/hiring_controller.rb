class HiringController < ApplicationController
  def index
    @query = EmployeeQuery.new(query_params.merge(user: current_user))
  end

  def show
  end

  private

  def query_params
    permitted = policy([:employees, :query]).permitted_attributes
    params.permit(permitted).tap do |whitelisted|
      whitelisted[:role_type_ids].reject!(&:empty?) if whitelisted[:role_type_ids].is_a?(Array)
    end
  end
end
